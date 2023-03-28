;; Define global variable for databases
(defvar *databases* (list (cons "default" nil)))

;; Define function to create a new database
(defun create-db (name)
  (push (cons name nil) *databases*))

;; Define function to switch to a different database
(defun use-db (name)
  (let ((db (assoc name *databases*)))
    (if db
        (setq *db* (cdr db))
        (error "No database named ~a" name))))


;; Define function to create a contact
(defun make-contact (first-name last-name address phone-number)
  `(:first-name ,first-name :last-name ,last-name :address ,address :phone-number ,phone-number))


;; Define function to add a contact to the current database
(defun add-contact (contact)
  (push contact *db*))


;; Define function to dump the current database
(defun dump-db ()
  (dolist (contact *db*)
    (format t "~{~a:~10t~a~%~}~%" contact)))


;; Define function to save the current database to a file
(defun save-db (filename)
  (with-open-file (out filename
                        :direction :output
                        :if-exists :supersede)
    (print *db* out)))


;; Define function to load a database from a file
(defun load-db (filename)
  (with-open-file (in filename)
    (setf *db* (read in))))


;; Define function to select contacts from the current database based on user-specified criteria
(defun select (selector-fn)
  (remove-if-not selector-fn *db*))


;; Define function to filter contacts based on user-specified criteria
(defun where (&key first-name last-name address phone-number)
  (lambda (contact)
    (and (if first-name (equal (getf contact :first-name) first-name) t)
         (if last-name (equal (getf contact :last-name) last-name) t)
         (if address (equal (getf contact :address) address) t)
         (if phone-number (equal (getf contact :phone-number) phone-number) t)))))


;; Switch to the default database
(use-db "default")
