;;; Callout poliline length.
;;; http://geodesist.ru/members/1958.30261/
;;; 17 Jul 2019.

(defun c:plcallout (/ tm curve l p a s)
 (initget 1 "L A LA G")
 (setq tm (getreal "Type <L/A/LA/G>: "))
 (vl-load-com)
 (setq c (car (entsel "Select line/polyline:")))
 (setq l (cond
  ((eq tm "L") (vla-get-length (vlax-ename->vla-object c)))
  ((eq tm "A") 0)
  ((eq tm "LA") (vla-get-length (vlax-ename->vla-object c)))
  ((eq tm "G") 0)
  (T 0)
 ))
 (setq a (cond
  ((eq tm "L") 0)
  ((eq tm "A") a (vla-get-area (vlax-ename->vla-object c)))
  ((eq tm "LA") a (vla-get-area (vlax-ename->vla-object c)))
  ((eq tm "G") a (vla-get-area (vlax-ename->vla-object c)))
  (T 0)
 ))
 (setq s (cond
  ((eq tm "L") (strcat "L = " (rtos l 2 3) "m"))
  ((eq tm "A") (strcat "S = " (rtos a 2 2) "m2"))
  ((eq tm "LA") (strcat "L = " (rtos l 2 3) "m\nS = " (rtos a 2 2) "m2"))
  ((eq tm "G") (strcat "S = " (rtos (/ a 10000) 2 2) "ga"))
  (T tm)
 ))
 (vl-cmdf "_leader" (getpoint "Select point insert:") pause "" s "")
 (princ)
)

;Signature
;|«Visual LISP© Format Options»
(100 1 2 2 nil " " 80 60 0 0 0 nil nil nil T)
;*** DO NOT add text below the comments! ***|;
