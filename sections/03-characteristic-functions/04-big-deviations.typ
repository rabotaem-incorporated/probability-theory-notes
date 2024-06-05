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
  Мы получали это при доказательстве закона больших чисел в форме Чебывеша (а вообще это очевидно получается из неравенства Чебышева).
]

#def[
  Случайная величина удовлетворяет _условию Крамера_, если $E e^(lambda xi) < +oo$ для некоторого $lambda > 0$.
]

#notice(name: "оценка Чернова")[
  Пусть $xi_1$, $xi_2$, ... --- независимые, одинаково распределенные. $a = E xi$, $r > a$. Будем интересоваться
  $
    P(S_n/n >= r) = P(lambda S_n >= n lambda r) = P(e^(lambda S_n) >= e^(lambda r n)) <=^"Марков" (E e^(lambda S_n))/(e^(lambda r n)).
  $
  Знаем
  $
    E e^(lambda S_n) = E e^(lambda sum xi_k) = E product e^(lambda xi_k) = product E e^(lambda xi_k) = (E e^(lambda xi_1))^n.
  $
  Поэтому
  $
   P(S_n/n >= r) <= (E e^(lambda S_n))/(e^(lambda r n)) = ((E e^(lambda xi_1))/(e^(lambda r)))^n.
  $
  Заведем $psi(lambda) := ln E e^(lambda xi_1)$. Тогда, переписав что выше,
  $
    P(S_n/n >= r) <= e^(n (psi(lambda) - lambda r)).
  $
  Заведем $I(r) := sup_lambda {lambda r - psi(lambda)}$ --- _функцию отклонения_. Тогда
  $
    P(S_n/n >= r) <= e^(-n I(r)).
  $
]

#example[
  Пусть $xi_k sim Nn(0, 1)$. Смотрим на $lambda r - ln E e^(lambda xi)$:
  $
    E e^(lambda xi) =
    1/sqrt(2pi) integral_RR e^(lambda t) e^(-t^2/2) dif t =
    e^(lambda^2/2)/sqrt(2pi) integral_RR e^(-(t - lambda)^2/2) dif t = e^(lambda^2/2) ==> psi(lambda) = lambda^2/2.
  $
  Значит $lambda r - lambda^2/2$ достигает максимума при $lambda = r$, и $I(r) = r^2/2$.

  Значит $P(S_n/n >= r) <= e^(-n r^2/2)$.
]

#example[
  $xi_k sim op("Exp")(1)$. Тогда при $lambda < 1$,
  $
    psi(lambda) = ln E e^(lambda xi) = ln (integral_0^(+oo) e^(lambda t) e^(-t) dif t) = ln lr((e^((lambda - 1) t))/(lambda - 1)|)_(t = 0)^(t = +oo) = ln 1/(1 - lambda) = -ln (1 - lambda),
  $
  Тогда $lambda r + ln (1 - lambda)$ имеет максимум при $lambda = 1 - 1/r$ и максимум равен $r - 1 - ln r$. Значит
  $
    P(S_n/n >= r) <= e^(-n (r - 1 - ln r)).
  $
]

#exercise[
  Если $xi_k sim Bern(p)$ независимы, то $psi(lambda) = ln E e^(lambda xi) = ln(1 - p + p e^lambda) <= p (e^lambda - 1)$. Досчитайте, что получится дальше.
]

#exercise[
  Если $xi_k sim Bern(p_k)$ независимы (но $p$ у каждого свое), $mu_i = p_1 + p_2 + ... + p_n$. Доказать, что для любого $delta > 0$
  $
    P(S_n >= (1 + delta) mu) < e^((-delta^2 mu) / (delta + 2)).
  $
]
