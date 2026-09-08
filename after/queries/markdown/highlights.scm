; ;; Match - [ ] at start of task lists
; ((list_marker) @_marker
;  (#match? @_marker "^- \\[ \\]"))
;  @checkbox.unchecked
;
; ;; Match - [x] at start of task lists
; ((list_marker) @_marker
;  (#match? @_marker "^- \\[x\\]"))
;  @checkbox.checked

;; extends

;; Tree-sitter Markdown exposes these nodes when GFM task lists are enabled
(task_list_marker_unchecked) @markup.list.unchecked
(task_list_marker_checked)   @markup.list.checked

;; extends

(task_list_marker_checked) @markup.list.checked

;; Match the text of a checked item by descending into the list item
(list_item
  (task_list_marker_checked)
  (paragraph
    (inline
      (inline) @completed.text (#set! priority 120))))

;; kill builtin spell captures in checked items
(list_item
  (task_list_marker_checked)
  (paragraph
    (inline) @nospell (#set! conceal)))

