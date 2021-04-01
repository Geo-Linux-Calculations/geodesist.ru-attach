;;; Callout poliline length.
;;; http://geodesist.ru/members/1958.30261/
;;; 17 Jul 2019.
(defun c:plcalloutlen (/)
 (vl-load-com)
 (setq curve (vlax-ename->vla-object (car (entsel "Select line/polyline >")))
       len_curve (vlax-curve-getDistAtPoint curve (vlax-curve-getEndPoint curve))
       pt (vlax-curve-getPointAtDist curve (/ len_curve 2))
 )
 (vl-cmdf "_leader" pt pause "" (strcat (rtos len_curve 2 2) " m") "")
 (princ)
)

;;; Callout poliline area.
;;; http://geodesist.ru/members/1958.30261/
;;; 18 Jul 2019.
(defun c:plcalloutarea (/)
 (vl-load-com)
 (setq c (car (entsel "Select line/polyline >"))
       ln (vlax-curve-getDistAtPoint c (vlax-curve-getEndPoint c))
       p (vlax-curve-getPointAtDist c (/ ln 2))
       a (strcat "S = " (rtos (vlax-curve-getArea c) 2 2) " m2")
 )
 (vl-cmdf "_leader" p pause "" a "")
 (princ)
)

;;; Callout poliline length and area.
;;; http://geodesist.ru/members/1958.30261/
;;; 17 Jul 2019.
(defun c:plcalloutlenarea (/)
 (vl-load-com)
 (setq c (car (entsel "Select line/polyline >"))
       l (strcat "L = "
                 (rtos (setq ln (vlax-curve-getDistAtPoint c (vlax-curve-getEndPoint c))) 2 2)
                 " m"
         )
       p (vlax-curve-getPointAtDist c (/ ln 2))
       a (strcat "S = " (rtos (/ (vlax-curve-getArea c) 10000) 2 2) " ga")
 )
 (vl-cmdf "_leader" p pause "" (strcat l "\n" a) "")
 (princ)
)

 ;Signature
 ;|«Visual LISP© Format Options»
(100 1 2 2 nil " " 80 60 0 0 0 nil nil nil T)
;*** DO NOT add text below the comments! ***|;
