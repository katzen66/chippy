;; Initialize instruction & register mapping
(let ((reg (list "A" "B" "C" "D" "E" "H" "M" "PC"))
      (mxp (list 0 1 2 3 4 6 7 5)))
  (defvar *reg_mxp* (pairlis reg mxp)))

(defstruct (instr (:constructor INSTR (op id operand_nr)))
  (op "" :type string)
  (id -1 :type integer)
  (operand_nr 0 :type integer))
(defvar *instructions* (list (INSTR "ADD" 1 1) (INSTR "MOV" 2 2) (INSTR "MVI" 3 2)))
(defun matchOP (op) (find op *instructions* :key #'instr-op :test #'string=))
(defun regid (reg) (format nil "~3,'0b" (cdr (assoc reg *reg_mxp* :test #'string=))))
(defun split-string (str sep)
  (loop with start = 0
        with ret = (list)
        for end = (position sep str :start start)
        for word = (subseq str start end)
        unless (string= word "") do (push word ret)
        while end do (setf start (+ 1 end))
        finally (return (nreverse ret))))
(loop for line = (read-line)
      while (not (string= "" line)) do
        (let ((asm (split-string line #\Space)))
          (let ((OP (matchOP (first asm))))
          (if (and OP (equal (instr-operand_nr OP) (+ -1 (length asm))))   
              (loop with i = 1
                    with OPCODE = (format nil "~2,'0b" (instr-id OP)) 
                    while (not (equal i (length asm)))
                    do
                      (setf OPCODE (concatenate 'string OPCODE (regid (nth i asm))))
                      (setf i (+ i 1))
                    finally (format t (format nil "~8,,,'0a" OPCODE))
              )
              (format t (concatenate 'string "Invalid op: " line)))
        (terpri))))

