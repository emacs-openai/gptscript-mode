;;; gptscript-mode.el --- Major mode for editing GPTScript natural language  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Shen, Jen-Chieh

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/emacs-openai/gptscript-mode
;; Version: 0.0.1
;; Package-Requires: ((emacs "26.1"))
;; Keywords: languages

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Major mode for editing GPTScript natural language.
;;

;;; Code:

(require 'rx)

(defgroup gptscript-mode nil
  "Major mode for editing GPTScript natural language."
  :prefix "gptscript-mode-"
  :group 'comm
  :link '(url-link :tag "Repository" "https://github.com/emacs-openai/gptscript-mode"))

(defvar gptscript-mode-syntax-table
  (let ((table (make-syntax-table)))
    table)
  "Syntax table for GPTScript file.")

(defface gptscript-mode-symbol-face
  '((t :inherit font-lock-builtin-face))
  "Face for highlighting symbols in GPTScript files."
  :group 'gptscript-mode)

(defconst gptscript-mode-parameters
  '("tool" "name" "model" "modelname" "description" "internalprompt" "tools"
    "args" "arg" "maxtoken" "maxtokens" "cache" "jsonresponse" "temperature")
  "List of parameters name.")

(defconst gptscript-mode-font-lock-keywords
  `((,(regexp-opt gptscript-mode-parameters 'symbols)
     . gptscript-mode-symbol-face))
  "Keywords in GPTScript file.")

;;;###autoload
(define-derived-mode gptscript-mode text-mode "GPTScript"
  "Major mode for editing GPTScript files."
  :syntax-table gptscript-mode-syntax-table
  (font-lock-add-keywords 'gptscript-mode gptscript-mode-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gpt\\'" . gptscript-mode))

(with-eval-after-load 'company-keywords
  (add-to-list 'company-keywords-alist
               `(gptscript-mode . ,gptscript-mode-parameters)))

(provide 'gptscript-mode)
;;; gptscript-mode.el ends here
