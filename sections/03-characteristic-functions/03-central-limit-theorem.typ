#import "../../utils/core.typ": *

== Центральная предельная теорема

#th(name: "Центральная предельная теорема в форме Поля Леви")[
  Пусть $xi_1$, $xi_2$, $xi_3$, ... --- независмые, одинаково распределенные случайные величины, $a := E xi_1$, $sigma^2 := D xi_1 > 0$ конечна, $S_n := xi_1 + xi_2 + ... + xi_n$. Тогда
  $
    P((S_n - n a)/(sigma sqrt(n)) <= x) = P((S_n - E S_n)/sqrt(D S_n) <= x) arrows Phi(x) = 1/sqrt(2pi) integral_(-oo)^x e^(-t^2/2) dif t,
  $
  где $Phi(x)$ --- функция распределения для $Nn(0, 1)$.
]

#proof[
  Сдвинем эти случайные величины на матожидание: считаем $E xi_k = 0$ и доказываем
  $
    S_n / (sigma sqrt(n)) "сходится к" Nn(0, 1) "по распределению".
  $
  Достаточно проверить поточечную сходимость характеристических функций.
  $
    phi_(S_n) (t) = phi_(xi_1 + xi_2 + ... + xi_n) (t) = product_(k = 1)^n phi_(xi_k) (t) = (phi_(xi_1) (t))^n.
  $
  Наличие моментов $xi_1$ означает наличие производных функции распределения. Напишем разложение $phi_(xi_1) (t)$ в ряд Тейлора:
  $
    1 - (sigma^2 t^2)/2 + o(t^2),
  $
  так как
  $
    E xi_1 = -i (phi'_xi_1) (0) = 0, quad
    D xi_1 = -phi''_(xi_1)(0) + (phi'_xi_1 (0))^2.
  $
  Тогда
  $
    phi_(S_n/(sigma sqrt(n))) (t) = phi_(S_n) (t/(sigma sqrt(n))) = (phi_xi_1 (t/(sigma sqrt(n))))^n = (1 - (sigma^2 t^2)/(2n sigma^2) + o(t^2/(sigma^2 n)))^n -->^? e^(-t^2/2)
  $
  Логарифмируем
  $
    n ln (1 - t^2/(2n) + o(1/n)) = n (-t^2/(2n) + o(1/n)) --> -t^2/2.
  $
]

#follow(name: "интегральная теорема Муавра-Лапласа", label: "clt-de-moivre-laplace-integral")[
  $xi_1$, $xi_2$, ... --- независимые бернуллевские случайные величины с вероятностью успеха $p in (0, 1)$, $q = 1 - p$. Тогда
  $ P((S_n - n p)/(sqrt(n p q)) <= x) arrows Phi(x). $
]

#(make_theorem("Интерлюдия"))[
  Посчитам характеристическую функцию для распределения Пуассона. Фиксируем $lambda > 0$.
  $
    phi_xi (t) = E e^(i t xi) = sum_(n = 0)^oo e^(i t n) P(xi = n) = sum_(n = 0)^oo e^(i t n) dot (lambda^n e^(-lambda))/n! = e^(-lambda) sum_(n = 0)^oo (e^(i t) lambda)^n/n! = e^(-lambda) e^(e^(i t) lambda) = e^(lambda (e^(i t) - 1)).
  $
]

#th(name: "Пуассона")[
  Пусть $xi_(n 1)$, $xi_(n 2)$, ..., $xi_(n n)$ независимые бернуллевские.
  $P(xi_(n k) = 1) = p_(n k)$. $p_(n 1) + p_(n 2) + ... + p_(n n) -->_(n->oo) lambda in [0, +oo)$ и $max {p_(n 1), p_(n 2), ..., p_(n n)} --> 0$, $S_n = xi_(n 1) + xi_(n 2) + ... + xi_(n n)$.
  Тогда $ P(S_n = k) --> (lambda^k e^(-lambda))/(k!). $
]

#notice[
  В старой теореме Пуассона $p_(n 1) = p_(n 2) = ... = p_(n n) =: p_n$, $n p_n --> lambda$.
]

#proof[
  Покажем, что $S_n$ сходится по распределению к $op("Poisson") (lambda)$.
  $
    phi_(xi_(n k)) (t) = E e^(i t xi_(n k)) = P(xi_(n k) = 0) + e^(i t) P(xi_(n k) = 1) = 1 - p_(n k) + e^(i t) p_(n k) = 1 + (e^(i t) - 1) p_(n k).
  $
  Тогда 
  $
    phi_(S_n) (t) = product_(k = 1)^n phi_(xi_(n k)) (t) = product_(k = 1)^n (1 + (e^(i t) - 1) p_(n k)) -->^? e^(lambda (e^(i t) - 1)).
  $
  Логарифмируем,
  $
    sum_(k = 1)^n ln(1 + (e^(i t) - 1) p_(n k)) -->^? lambda (e^(i t) - 1).
  $
  $
    sum_(k = 1)^n ((e^(i t) - 1) p_(n k) + O(p_(n k)^2)) = (e^(i t) - 1) underbrace(sum_(k = 1)^n p_(n k), --> lambda) + O(sum_(k = 1)^n p_(n k)^2).
  $
  Надо доказать, что $sum_(k = 1)^n p_(n k)^2 --> 0$:
  $
    sum_(k = 1)^n p_(n k)^2 <= underbrace(max_(k = 1,...,n) {p_(n k)}, --> 0) underbrace(sum_(k = 1)^n p_(n k), --> lambda) --> 0.
  $
  Наконец,
  $
    P(S_n = k) = F_(S_n) (k + 1/2) - F_(S_n) (k - 1/2) --> F(k + 1/2) - F(k - 1/2) = P(eta = k),
  $
  где $eta sim op("Poisson") (lambda)$.
]

#th(name: "Центральная предельная теорема в форме Линденберга")[
  Пусть $xi_1$, $xi_2$, $xi_3$, ... --- независмые, $a_n := E xi_n$, $sigma_n^2 := D xi_n > 0$, $S_n := xi_1 + xi_2 + ... + xi_n$, $D_n^2 := sum_(k = 1)^n sigma_k^2$ конечна. Тогда если для любого $eps > 0$
  $
    op("Lind") (eps, n) := 1/D_n^2 sum_(k = 1)^n E f(xi_k - a_k) -->_(n -> +oo) 0,
  $
  где $f(x) := x^2 dot bb(1)_{abs(x) >= eps D_n}$, то
  $
    P((S_n - E S_n)/sqrt(D S_n) <= x) arrows Phi(x) = 1/sqrt(2pi) integral_(-oo)^x e^(-t^2/2) dif t,
  $
  где $Phi(x)$ --- функция распределения для $Nn(0, 1)$.
]

#proof[
  Ладно доказывать... вы хотите эту теорему _применять_?..
]

#th(name: "Центральная предельная теорема в форме Ляпунова")[
  Пусть $xi_1$, $xi_2$, $xi_3$, ... --- независмые, $a_n := E xi_n$, $sigma_n^2 := D xi_1 > 0$, $S_n := xi_1 + xi_2 + ... + xi_n$, $D_n^2 := sum_(k = 1)^n sigma_k^2$ конечна. Пусть
  $
    L(delta, n) := 1/D_n^(2 + delta) sum_(k = 1)^n E abs(xi_k - a_k)^(2 + delta) -->_(n -> oo) 0 "для некоторого" delta > 0.
  $
  Тогда
  $
    P((S_n - E S_n)/sqrt(D S_n) <= x) arrows Phi(x) = 1/sqrt(2pi) integral_(-oo)^x e^(-t^2/2) dif t,
  $
]

#let Lind = math.op("Lind")

#proof[
  Выведем из Линденберга.
  
  Очевидно,
  $
    f(x) <= x^2 (abs(x)/(eps D_n))^delta.
  $
  Значит
  $
    Lind(eps, n) =
    1/D_n^2 sum_(k = 1)^n E f(xi_k - a_k) <=
    1/D_n^2 sum_(k = 1)^n (E abs(xi_k - a_k)^(2 + delta))/(eps^delta dot D_n^delta) newline(=)
    1/eps^delta dot 1/(D_n^(2 + delta)) sum_(k = 1)^n E abs(xi_k - a_k)^(2 + delta) =
    L(delta, n)/eps^delta -->_(n -> oo) 0.
  $
]

#th[
  В предположении теоремы Ляпунова, пусть $delta in (0, 1)$. Тогда
  $
    abs(P((S_n - E S_n)/sqrt(D S_n) <= x) - Phi(x)) <= C_delta dot L(delta, n).
  $
]

#proof[
  Если бы мы ее доказывали, мы бы не выводили Ляпунова из Линденберга.
]

#notice[
  Если случайные величины одинаково распределны,
  $
    L(delta, n) = 1/(sqrt(n) sigma)^(2 + delta) dot n E abs(xi_1 - a)^(2 + delta) = E abs(xi_1 - a)^(2 + delta)/(n^(delta/2) sigma^(2 + delta)).
  $
]

#th(name: "Берри-Эссеена")[
  Пусть $xi_1$, $xi_2$, $xi_3$, ... --- независмые, одинаково распределенные случайные величины, $a := E xi_1$, $sigma^2 := D xi_1$. Тогда
  $
    abs(P((S_n - n a)/(sqrt(n) sigma) <= x) - Phi(x)) <= C (E|xi_1 - a|^3)/(sqrt(n) sigma^3).
  $
]

#proof[
  нет.
]

#notice[
  Для схемы Бернулли,
  $ (E abs(xi_1 - a)^3)/sigma^3 = (p^2 + q^2)/sqrt(p q). $
]

#notice[
  Про константу $C$ из условия теоремы:
  - Эссеен (1956): $C >= (sqrt(10) + 3)/(6 sqrt(2pi)) approx 0.4037...$
  - Реально доказать $C >= 1/sqrt(2pi)$.
  - Шевцова (2014): $C <= 0.463$.
]

#th(name: "Хартмана-Винтнера, более известна как закон повторного логарифма")[
  Пусть $xi_1$, $xi_2$, ... независимые, одинаково распределенные случайные величины, $E xi_1 = 0$, $sigma^2 = D xi_1 > 0$ конечная. Тогда
  $
    limsup S_n/(sqrt(2n ln ln n)) &= sigma,\
    liminf S_n/(sqrt(2n ln ln n)) &= -sigma,\
  $
]

#notice[
  В ЦПТ $S_n/(sqrt(n) sigma)$ стримится к $Nn(0, 1)$. Если мы делим хоть на чуть-чуть побольше ($ln ln n$), то все распределение попадет в отрезок.
]

#th(name: "Штрассена")[
  Пусть $xi_1$, $xi_2$, ... независимые, одинаково распределенные случайные величины, $E xi_1 = 0$, $sigma^2 = D xi_1 > 0$ конечная. Тогда любая точка из $[-sigma, sigma]$ --- предельная для последовательности $S_n/(sqrt(2n ln ln n))$.
]
