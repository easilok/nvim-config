(local M {:options {:default_name :session
                    :old_sessions 30
                    :sassy_dir (.. (vim.fn.stdpath :data) "/sassy")}
          :sassy_is_tracking false})

(fn clean-path [name]
  "Clean file and directory names to more accessible text"
  (when name
    ; Replace whitespace with underscores and remove any problematic characters
    (: (name:gsub "%s+" "_")
       :gsub
       "[^%w_-]" "")))

(fn get-git-root []
  "Get git project by root directory"
  (let [git-root (vim.fn.system "git rev-parse --show-toplevel | tr -d \"\\n\" 2>/dev/null")]
    (when (= vim.v.shell_error 0)
        (vim.fn.fnamemodify git-root ":t"))))

(fn get-root-directory []
  "Get root directory known to current vim instance"
  (let [cwd (vim.fn.getcwd)]
    (vim.fn.fnamemodify cwd ":t")))

(fn get-git-branch []
  "Get current git branch"
  (let [branch (vim.fn.system "git branch --show-current | tr -d \"\\n\" 2>/dev/null")]
    (when (= vim.v.shell_error 0)
        branch)))

(fn ensure-directory [path]
  "Ensure directory exists"
  (vim.fn.mkdir path :p))

(fn check-existing-session [session-path]
  "Checks if a section for the desired project branch already exists."
  (when session-path nil 
    (not (= (vim.fn.filereadable session-path) 0))))

(fn create-new-session [sassy]
  (let [project (or (get-git-root) (get-root-directory))
        session (or (get-git-branch) sassy.options.default_name)
        base-dir sassy.options.sassy_dir
        project-dir (.. base-dir "/" (clean-path project))
        session-path (string.format "%s/%s.vim" project-dir (clean-path session))]
    (ensure-directory project-dir)
    (if (check-existing-session session-path)
        (let [  (ok _) (pcall vim.api.nvim_exec2 (.. "source " session-path) {})
                obsession-status (vim.call "ObsessionStatus")]
            (set sassy.sassy_is_tracking true)
            (when (not ok)
                (if (= obsession-status ",S,")
                    (do
                        (vim.notify "Error loading session but starting Obsession anyway..."
                                    vim.log.levels.INFO)
                        (vim.cmd :Obsession))
                    (do
                        (vim.notify "Could not load session..." vim.log.levels.ERROR)
                        (set sassy.sassy_is_tracking false)))))
        (do
            (vim.cmd (.. "Obsession " session-path))
            (set sassy.sassy_is_tracking true)))))

(fn M.start_session [self]
  "Starts an 'Obsession' for the current project's checked out branch. If session file already exists, source it"
  (let [obsession-status (vim.call "ObsessionStatus")]
    (if (and self.sassy_is_tracking (= obsession-status "[S]"))
        (vim.cmd :Obsession)
        (create-new-session self))))

(fn M.stop_session [self]
   "Stops tracking the current session (if exists)"
  (if (not self.sassy_is_tracking)
    (vim.notify "No current tracking session" vim.log.levels.ERROR)
    (let [obsession-status (vim.call "ObsessionStatus")]
        (if (= obsession-status "[$]")
            (do
              (vim.cmd :Obsession)
              (set self.sassy_is_tracking false))
            (vim.notify "Obsession not reporting onging session" vim.log.levels.ERROR)))))

(fn M.clean_sessions []
  "Remove existing session files older than configuration"
  (let [base-dir M.options.sassy_dir
        cmd (string.format "find %s -type f -name \"*.vim\" -mtime +%d -exec rm -f {} \\;"
                           base-dir
                           M.options.old_sessions)]
    (vim.fn.system cmd)
    (if (= vim.v.shell_error 0)
        (vim.notify "Deleted old sessions." vim.log.levels.INFO)
        (vim.notify "Something went wrong cleaning old sessions"
                    vim.log.levels.ERROR))))

(fn setup-commands []
  "Setup sassy vim commands"
  (vim.api.nvim_create_user_command :Sassy (fn [] (M:start_session)) {})
  (vim.api.nvim_create_user_command :SassyStop (fn [] (M:stop_session)) {})
  (vim.api.nvim_create_user_command :SassyClean (fn [] (M:clean_sessions)) {}))

(fn M.setup [self options]
  "Setup module for custom properties"
  (when options
    (each [k v (ipairs options)] (tset self.options k v)))
  (setup-commands))

(M:setup)

M
