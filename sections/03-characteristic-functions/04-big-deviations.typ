#import "../../utils/core.typ": *

== Вероятности больших отклонений

#th(name: "Факт из закона больших чисел в форме Чебывеша")[
  Пусть $xi_1$, $xi_2$, ... --- независимые, одинаково распределенные случайные величины, и $E xi_1 = a$, $D xi_1 = sigma^2$ конечна. Тогда
  $
    P(abs(S_n/n - a) >= eps) <= sigma^2/(n eps^2)
  $
  В частности, при $r > a$,
  $
    P(S_n / n >= r) <= sigma^2/(n (r - a)^2).
  $
]

#proof[
  Мы получали это при доказательстве закона больших чисел в форме Чебывеша.
]

#def[
  Случайная величина удовлетворяет _условию Крамера_, если $E e^(lambda xi) < +oo$ для некоторого $lambda > 0$.
]

#th(name: "оценка Чернова")[
  Пусть $xi_1$, $xi_2$, ... --- независимые, одинаково распределенные. Будем интересоваться
  $
    P(S_n/n >= r) = P(lambda S_n >= n lambda r) = P(e^(lambda S_n) >= e^(lambda r n)) <=^"Марков" (E e^(lambda S_n))/(e^(lambda r n)).
  $
  Знаем
  $
    E e^(lambda S_n) = E e^(lambda sum xi_k) = E product e^(lambda xi_k) = product E e^(lambda xi_k) = (E e^(lambda xi_1))^n
  $
  Поэтому
  $
    (E e^(lambda S_n))/(e^(lambda r n)) = (E e^(lambda xi_1))^n/(e^(lambda r)).
  $


]
