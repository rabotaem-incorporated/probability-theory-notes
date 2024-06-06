#import "../../utils/core.typ": *

== Ветвящиеся процессы

Пусть у нас есть какие-то частицы, которые разможаются, умирают, и т.д. С вероятностью $f_k$ частица превращается в $k$ частиц. Изначально частиц $eta_0 = 1$. На следующем шаге частиц $eta_1 = xi_1^((1))$, где $xi_k^((n))$ --- количество частиц, которые превратились в $k$-я частица на $n$-м шаге. Соответсвенно на втором шаге частиц будет $eta_2 = xi_1^((2)) + xi_2^((2)) + ... + xi_(eta_1)^((2))$. $P(xi_j^((n)) = k) = f_k$.

Давайте этот процесс изучать.

Пусть $F(t) = G_(xi_j^((n))) (t) = sum_(k = 0)^oo f_k t^k$. Хотим понять $G_(eta_n) (t)$. Согласно последнему примеру из предыдущего параграфа, это $G_(eta_(n - 1)) (F(t))$. То есть по индукции, это $G_n (t) = F(F(F(... F(t) ...)))$. Хотим узнать $E eta_n = G'_n (1)$, а $G_n (t) = G_(n - 1) (F(t))$. Тогда
$
  G'_n (t) = G'_(n - 1) (F(t)) F'(t) ==> G'_n (1) = G'_(n - 1) (F(1)) F'(1) = a dot G'_(n - 1) (1) = a E eta_(n - 1).
$
Значит $E eta_n = a^n$.

#th[
  Рассмотрим ветвящийся процесс с производящей функцией числа потомков $F$. Тогда вероятность его вырождения (то есть того, что в какой-то момент потомки исчезнут вообще) равна наименьшему положительному корню уравнения $F(x) = x$.
]

#notice[
  $F$ возрастает на $[0, 1]$. $F'$ тоже, поэтому функция выпукла. А еще $F(1) = 1$, то есть наименьший положительный корень не больше $1$. Собственно, это корень, который получается в другой точке пересечения графика $F$ с прямой $y = x$ (если такая есть).
  #TODO[картинка]
  Если производная в единице, то есть матожидание $xi_j^((n))$ не больше $1$, то вероятность вырождения равна $1$, а при больших значениях --- что-то меньшее $1$.
]

#proof(name: "теоремы")[
  $A_n = {eta_n = 0}$ -- событие того, что на $n$-м шаге никого не осталось. Очевидно, $... subset A_n subset A_(n + 1) subset ...$. Значит $P(A_1) <= P(A_2) <= P(A_3) <= ...$ --- а у таких последовательностей есть предел. Назовем его $q := lim P(A_n)$. Тогда
  $
    P(A_n) = P(eta_n = 0) = underbrace(G_(eta_n), := G_n) (0) = F compose G_(n - 1) (0).
  $
  Обозначим $q_n := P(A_n)$. Тогда $q_n = F(q_(n - 1))$. Значит
  $
    q = lim q_n = lim F(q_(n - 1)) = F(lim q_(n - 1)) = F(q).
  $
  Тогда $q$ --- корень уравнения $F(x) = x$. Пусть $y$ --- наименьший неотрицательный корень. Тогда $y >= 0$, и $F(y) >= F(0) = G_1 (0) = q_1$. По индукции проверим, что $q_n <= y$. База есть. Переход очевиден: $q_(n + 1) = F(q_n) <= F(y) = y$. Значит $q_n <= y$ для любого $n$, и $q = lim q_n <= y$. Значит $q = y$ (наименьший неотрицательный корень). 
]

#follow[
  Если $E xi_1 = 1$, то вероятность вырождения равна $1$ (график $F$ касается $x = y$).
]

#th[
  Пусть $E xi_1 = 1$, $0 < D xi_1 = sigma^2 < oo$, $q_n$ --- вероятность вырождения к $n$-ому шагу. $gamma_n := q_(n + 1) - q_n$ --- вероятность вырождения от $n$-го к $(n + 1)$-му поколению. Тогда
  $
    gamma_n sim 2/(sigma^2 n^2), quad 1 - q_n sim 2/(sigma^2 n).
  $
]

#proof[
  Введем обозначения:
  $
    q_n &:= P(eta_n = 0) = G_n (0) = F(q_(n - 1)), \
    p_n &:= 1 - q_n, p_n = 1 - F(1 - p_(n - 1)), \
    tilde(F) (x) &:= 1 - F(1 - x), p_n = tilde(F) (p_(n - 1)).
  $
  Разложим $tilde(F)$ в ряд:
  $
    tilde(F) (0) &= 1 - F(1) = 0, \
    tilde(F)' (x) = (1 - F(1 - x))' = F'(1 - x) ==> tilde(F)' (0) &= F' (1) = E xi_1 = 1, \
    tilde(F)''(x) = -F''(1 - x) ==> tilde(F)'' (0) &= -F''(1) = -D xi_1 = -sigma^2.
  $
  Тогда
  $
    tilde(F) (x) = x - (sigma^2 x^2)/2 + o(x^2).
  $
  Рассмотрим $a_n = 1/p_n$, а точнее 
  $
    a_(n + 1) - a_n =
    1/p_(n + 1) - 1/p_n =
    (p_n - p_(n + 1))/(p_(n + 1) p_n) =
    (p_n - tilde(F) (p_n))/(p_n tilde(F) (p_n)) =
    (p_n - (p_n - (sigma^2 p_n^2)/2 + o(p_n^2)))/(p_n (p_n + o(p_n))) newline(=)
    ((sigma^2 p_n^2)/2 + o(p_n^2))/(p_n^2 + o(p_n^2)) = (sigma^2/2 + o(1))/(1 + o(1)) = sigma^2/2 + o(1) ==> a_n sim (n sigma^2)/2 ==> p_n = 1/a_n sim 2/(n sigma^2).
  $
  по теореме Штольца.

  Распишем $gamma$:
  $
    gamma_n = q_(n + 1) - q_n = (1 - p_(n + 1)) - (1 - p_n) = p_n - p_(n + 1) = p_n - tilde(F)(p_n) newline(=) (sigma^2 p_n^2)/2 + o(p_n^2) sim (sigma^2 p_n^2)/2 sim sigma^2/2 dot (2/(n sigma^2))^2 = 2/(sigma^2 n^2).
  $
]
