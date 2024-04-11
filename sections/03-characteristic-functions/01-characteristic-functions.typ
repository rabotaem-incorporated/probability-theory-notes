#import "../../utils/core.typ": *

== Характеристические функции

#def[
  _Комплекснозначная случайная величина_ --- это функция $xi: Omega --> CC$, где $Re xi$, $Im xi$ --- измеримые функции.
]

#def[
  $E xi := E (Re xi) + i E (Im xi)$.
]

#props[
  + Математическое ожидание комплексно-линейно.
  + $abs(E xi) <= E abs(xi)$.
]

#proof[
  Знаем из матана.
]

#def[
  Если $xi$ --- вещественно-значная случайная величина, то $phi_xi (t) := E e^(i t xi)$ называется _характеристической функцией_ $xi$.
]

#props[
  1. $phi_xi (0) = 1$ и $abs(phi_xi (t)) <= 1$ для всех $t in RR$.
  
  2. $phi_(a xi + b) (t) = e^(i b t) phi_xi (a t)$.

  3. $phi_xi (-t) = overline(phi_xi (t))$.

  4. Если $xi, eta$ независимы, то $phi_(xi + eta) (t) = phi_(xi) (t) phi_(eta) (t)$.

  5. Если $xi_1$, $xi_2$, ..., $xi_n$ независимы, то $phi_(xi_1 + xi_2 + ... + xi_n) (t) = phi_(xi_1) (t) phi_(xi_2) (t) ... phi_(xi_n) (t)$.

  6. $phi_xi$ --- равномерно непрерывна.  
]

#proof[
  1. $abs(phi_xi (t)) = abs(E e^(i t xi)) <= E abs(e^(i t xi)) = E 1 = 1$.

  2. $phi_(a xi + b) (t) = E e^(i t (a xi + b)) = e^(i t b) E e^(i t a xi) = e^(i t b) phi_xi (a t)$.

  4. $phi_(xi + eta) (t) = E e^(i t (xi + eta)) = E e^(i t xi) e^(i t eta) = phi_xi (t) phi_eta (t)$.

  6. $phi_xi (t + h) - phi_xi (t) = E e^(i (t + h) xi) - E e^(i t xi) = E (e^(i t xi) (e^(i h xi) - 1))$. Значит
    $
      abs(phi_xi (t + h) - phi_xi (t)) <= E abs(e^(i t xi) (e^(i h xi) - 1)) <= E abs(e^(i h xi) - 1) -->^?_(h -> 0) 0.
    $
    Чтобы доказать $?$, надо объяснить, почему мы можем переставлять интеграл (матожидание) с пределом (по $h$).
    $
      E abs(e^(i h xi) - 1) = integral_RR abs(e^(i h x) - 1) dif P_xi (x),
    $
    а у этой функции есть суммируемая мажоранта $2$. Значит
    $
      E abs(e^(i h xi) - 1) --> integral_RR underbrace(lim_(h -> 0) abs(e^(i h x) - 1), 0) dif P_xi (x) = 0.
    $
]

#example[
  Рассмотрим $xi sim Nn(a, sigma^2)$. Пусть $eta sim Nn(0, 1)$, тогда $xi sim sigma eta + a$. Считаем 
  $ 
    phi_eta (t) =
    E e^(i t eta) =
    integral_RR e^(i t x) dif P_eta (x) =
    1/sqrt(2 pi) integral_RR e^(i t x) e^(-x^2/2) dif x =
    e^(-t^2/2)/sqrt(2pi) underbrace(integral_RR e^(-(x - i t)^2/2) dif x, =: I).
  $
  Надо проинтегрировать $integral_Gamma_R e^(-z^2/2) dif z = 0$, где $Gamma_R$ --- граница прямоугольника $[-R; R] times [0, -i t]$.
  #TODO[картинка]
  Тогда
  $
    0 = integral_Gamma_R e^(-z^2/2) dif z =
    integral_(-R - i t)^(R - i t) e^(-z^2/2) dif z +
    integral_(R - i t)^(R) e^(-z^2/2) dif z +
    integral_(R)^(-R) e^(-z^2/2) dif z +
    integral_(-R)^(R - i t) e^(-z^2/2) dif z.
  $
  Первый интеграл стремиться к $I$. Второй к $0$, так как
  $
    abs(integral_(R - i t)^R e^(-z^2/2) dif z) =
    abs(i integral_(-t)^0 e^(-R^2/2) dif x) =
    abs(i e^(-R^2/2) t) --> 0.
  $
  Третий --- это $-sqrt(2pi)$. Четвертый аналогично второму стремится к $0$. Значит $I = sqrt(2pi)$.

  Значит $phi_eta (t) = e^(-t^2/2)$, и $phi_(sigma eta + a) (t) = e^(i a t) e^(-sigma^2 t^2 / 2)$.
]

#th[
  Если $E abs(xi)^n < +oo$, то при $k = 1, 2, ..., n$,
  $
    phi^((k))_xi (t) = E((i xi)^k e^(i t xi)).
  $
  В частности, $phi_xi^((k)) (0) = i^k E xi^k$.
]

#proof[
  Индукция по $k$. База очевидна. Переход $k ~~> k + 1$:

  $
    phi_xi^((k + 1)) (t) =
    lim_(h -> 0) (phi_xi^((k)) (t + h) - phi_xi^((k)) (t)) / h =
    lim_(h -> 0) (E (i xi)^k e^(i (t + h) xi) - E ((i xi)^k e^(i t xi))) / h newline(=)
    lim_(h -> 0) E((i xi)^k dot e^(i t xi) dot (e^(i h xi) - 1)/h) =
    lim integral_Omega ((i xi)^k) dot e^(i t xi) dot (e^(i h xi) - 1)/h dif P newline(=^?)
    integral_Omega (i xi)^k dot e^(i t xi) dot underbrace(lim_(h -> 0) (e^(i h xi) - 1)/h, i xi) dif P =
    E ((i xi)^(k + 1) e^(i t xi)).
  $
  Почему можно менять местами интеграл с переделом в $?$. Потому что есть суммируемая мажоранта:
  $
    abs((i xi)^k e^(i t xi) (e^(i h xi) - 1)/h) =
    abs(xi)^k abs((e^(i h xi) - 1)/h).
  $
  Если $abs(xi(omega) h) >= 1$, то $1/abs(h) <= abs(xi)$, и все произведение не больше $2 abs(xi)^(k + 1)$. Если $abs(xi(omega) h) < 1$, то
  $
    abs(xi)^k dot abs((e^(i h xi) - 1) / h) = abs(xi)^(k + 1) dot abs((e^(i h xi) - 1)/(xi h)) <= C abs(xi)^(k + 1).
  $
]

#follow[
  $D xi = -phi''_xi (0) + (phi'_xi (0))^2$.
]

#proof[
  $
    cases(
      E xi^2 = -phi''_xi (0),
      E xi = i phi'_xi (0),
    ) ==> D xi = E xi^2 - (E xi)^2 = -phi''_xi (0) + (phi'_xi (0))^2.
  $
]

#th[
  Если существует конечная $phi_xi^((2n)) (0)$, то $E xi^(2n) < +oo$.
]

#proof[
  В общем случае доказательства не будет, мы докажем для второй производной. Общее доказательство будет аналогичным, но формулы будут громоздкими.
  $
    E xi^2 = integral_RR x^2 dif P_xi (x).
  $
  Интеграл всегда существует, нам надо понять, что он конечен.
  $
    E xi^2 =
    integral_RR x^2 dif P_xi (x) =
    integral_RR lim_(h -> 0) (sin(x h)/h)^2 dif P_xi (x) <=^"Фату"
    liminf_(h -> 0) integral_RR (sin(x h)/h)^2 dif P_xi (x) newline(=)
    liminf_(h -> 0) -integral_RR (e^(2 i h x) + e^(-2i h x) - 2)/(4h^2) dif P_xi (x) =
    liminf_(h -> 0) -1/(4h^2) integral_RR e^(2 i h x) + e^(-2i h x) - 2 dif P_xi (x) newline(=)
    liminf_(h -> 0) -1/(4h^2) (phi_xi (2h) + phi_xi (-2h) - 2).
  $
  Разложим $phi_xi (t)$ в ряд Тейлора:
  $
    phi_xi (t) = 1 + phi'_xi (0) t + phi''_xi (0) t^2/2 + o(t^2).
  $
  Значит
  $
    phi_xi (2h) + phi_xi (-2h) - 2 = phi''_xi (0) (2h)^2 + o(h^2).
  $
  Подставляем это в выкладки выше:
  $
    E xi^2 =
    liminf_(h -> 0) -1/(4h^2) (phi_xi (2h) + phi_xi (-2h) - 2) =
    liminf_(h -> 0) -1/(4h^2) (phi''_xi (0) (2h)^2 + o(h^2)) =
    -phi''_xi (0).
  $
]

#th(name: "формула обращения")[
  Пусть $a < b$, $P(xi = a) = P(xi = b) = 0$. Тогда
  $
    P(a <= xi <= b) = lim_(T -> +oo) 1/(2pi) integral_(-T)^T (e^(-i a t) - e^(-i b t))/(i t) phi_xi (t) dif t.
  $
]
#notice[
  Интеграл $integral_(-oo)^(+oo)$ может быть расходящимся, зато $"v.p." integral_(-oo)^(+oo)$ должен сходиться. Поэтому мы пишем $lim_(T -> +oo)$.
]

#proof[
  *Шаг 1: $a = -1$, $b = 1$*. Надо доказать
  $
    P(-1 <= xi <= 1) =^? lim_(T -> +oo) 1/(2pi) integral_(-T)^T (e^(i t) - e^(-i t))/(i t) phi_xi (t) dif t.
  $
  Преобразуем внутренний интеграл:
  $
    integral_(-T)^T (e^(i t) - e^(-i t))/(i t) phi_xi (t) dif t =
    integral_(-T)^T (e^(i t) - e^(-i t))/(i t) integral_RR e^(i t x) dif P_xi (x) dif t =^"Фубини"
    integral_RR underbrace(integral_(-T)^T (e^(i t) - e^(-i t))/(i t) e^(i t x) dif t, =: Phi_T (x)) dif P_xi (x).
  $
  Теорему Фубини можно применить, так как
  $
    abs((e^(i t) - e^(-i t))/(i t) e^(i t x)) = abs((e^(i t) - e^(-i t))/t) <= 2.
  $
  при $abs(t) >= 1$. При $abs(t) <= 1$ это непрерывная функция ограниченная на компакте $[-1, 1]$.

  $
    Phi_T (x) =
    integral_(-T)^T (e^(i t) - e^(-i t))/(i t) e^(i t x) dif t =
    integral_(-T)^T integral_(-1)^1 e^(i u t) dif u space e^(i t x) dif t =^"Фубини"_"+очев."
    integral_(-1)^1 integral_(-T)^T e^(i u t) e^(i t x) dif t dif u newline(=)
    integral_(-1)^1 lr(e^(i t (u + x))/(i (u + x)) |)_(t = -T)^(t = +T) dif u =
    integral_(-1)^1 (2 sin (T (u + x)))/(u + x) dif u =^(y = T (u + x))
    integral_(T (x - 1))^(T (x + 1)) (2 sin y)/y dif y.
  $
  При $x > 1$, $T(1 + x)$ и $T(x - 1) --> +oo$, а если $x < -1$, то $T(1 + x)$ и $T(x - 1) --> -oo$, значит $Phi_T (x) -->_(T-->+oo) 0$. При $-1 < x < 1$:
  $
    cases(
      T(1 + x) --> +oo,
      T(x - 1) --> -oo,
    ) ==> Phi_T (x) -->_(T -> +oo) integral_RR (2 sin y)/y dif y = 2 pi.
  $
  Значит $Phi_T (x) --> 2pi dot bb(1) (x)$ при $x != plus.minus 1$. Тогда
  $
    lim_(T --> +oo) 1/(2pi) integral_(-T)^T (e^(i t) - e^(-i t))/(i t) phi_xi (t) dif t =
    lim_(T -> +oo) 1/(2pi) integral_RR Phi_T (x) dif P_xi (x) newline(=^?)
    1/(2pi) integral_RR lim_(T -> +oo) Phi_T (x) dif P_xi (x) =
    1/cancel(2pi) integral_RR cancel(2 pi) bb(1)_[-1, 1] dif P_xi (x) =
    P_xi ([-1, 1]) = P(-1 <= xi <= 1).
  $
  Нужна мажоранта, чтобы переставлять интеграл с пределом:
  $
    abs(Phi_T (x)) =
    abs(integral_(T (x - 1))^(T (x + 1)) (2 sin y)/y dif y) <=
    sup_(v < w) abs(integral_v^w (2 sin y)/y dif y) <=
    2 sup_w abs(integral_0^w (2 sin y)/y dif y) <
    +oo.
  $

  *Шаг 2: произвольные $a, b$*. Рассмотрим $eta$ такое, что
  $xi = (b - a)/2 eta + (a + b)/2$. $[a, b]$ переходит в $[-1, 1]$. Тогда 
  $
    phi_xi (t) = phi_eta ((b - a)/2 t) e^(i (a + b)/2 t).
  $
  Подставляем это в доказанное:
  $
    P(a <= xi <= b) = P(-1 <= eta < 1) = lim_(T -> +oo) 1/(2pi) integral_(-T)^T (e^(-i t) - e^(i t))/(i t) phi_eta dif t.
  $
  Надо доказать, что
  $
    lim_(t -> +oo) 1/(2pi) integral_(-T)^T (e^(-i t) - e^(i t))/(i t) phi_eta dif t =
    lim_(t -> +oo) 1/(2pi) integral_(-T)^T (e^(-i a t) - e^(-i b t))/(i t) phi_xi dif t.
  $
  Подставляем $phi_xi$:
  $
    integral_(-T)^T (e^(-i a t) - e^(-i b t))/(i t) phi_xi dif t =
    integral_(-T)^T (e^(-i a t) - e^(-i b t))/(i t) phi_eta ((b - a)/2 t) e^(i (a + b)/2 t) dif t newline(=)
    integral_(-T)^T (e^(i (b - a)/2 t) - e^(- i (b - a)/2 t))/(i t) phi_eta ((b - a)/2 t) dif t = integral_(-(b-a)/2 T)^((b - a)/2 T) (e^(i tau) - e^(-i tau)) / (i tau) phi_eta (tau) dif tau.
  $
]

#follow[
  Если $phi_xi = phi_eta$, то $P_xi = P_eta$.
]

#proof[
  Пусть $A:= {x in R: P(xi = x) > 0 "или" P(eta = x) > 0}$ --- не более чем счетное множество.

  Если $a, b in.not A$, то $P_xi ([a,b]) = P_eta ([a,b])$. Тогда функции распределения совпадают в точках не из $A$, так как для $a_n arrow.br -oo$, $a in.not A$: $ F_xi (b) = lim_(a_n -> -oo) P_xi ([a_n, b]) = lim P_eta ([a_n, b]) = F_eta (b). $

  Если $b in A$, то рассмотрим $b_n arrow.br b$, $b_n in.not A$. Там
  $
    P_xi (b) <-- F_xi (b_n) = F_eta (b_n) --> P_eta (b).
  $
  Значит $F_xi = F_eta$ везде, и $P_xi = P_eta$. 
]

#follow[
  Если $integral_RR |phi_xi (t)| dif t < +oo$, то $xi$ абсолютно непрерывна и $rho_xi (x) = 1/(2pi) integral_RR e^(-i t x) phi_xi (t) dif t$ --- эта штука называется преобразованием Фурье.
]

#proof[
  $
    integral_(-oo)^(+oo) (e^(-i a t) - e^(-i b t))/(i t) phi_xi (t) dif t
  $
  абсолютно сходится: под интегралом стоит ограниченная функция. Значит можно писать интеграл из теоремы об обращении даже не в смысле главного значения. Тогда
  $
    P(a <= xi <= b) =
    1/(2pi) integral_RR (e^(-i a t) - e^(-i b t))/(i t) phi_xi (t) dif t =
    1/(2pi) integral_RR integral_a^b e^(-i t u) phi_xi (t) dif u dif t newline(=^"Фубини")
    1/(2pi) integral_a^b underbrace(integral_RR e^(-i t u) phi_xi (t) dif t, p_xi (u)) dif u =
    integral_a^b p_xi (u) dif u.
  $
  Значит $p_xi$ --- плотность меры $P_xi$. 
]

#th[
  Пусть $xi_k sim Nn(a_k, sigma_k^2)$ независимые, $c_1, c_2, ..., c_n$ --- константы, и не все равны $0$. Тогда
  $
    xi = a_0 + sum_(k = 1)^n c_k xi_k sim Nn(a, sigma^2),
  $
  где $a = a_0 + sum_(k = 1)^oo c_k a_k$, а $sigma^2 = sum_(k = 1)^n c_k^2 sigma_k^2$.
]

#proof[
  Характеристическая функция $xi$ равна
  $
    phi_xi (t) = e^(i a_0 t) dot phi_xi_1 (c_1 t) dot phi_xi_2 (c_2 t) dot  ... dot phi_xi_n (c_n t),
  $
  и подставим
  $
    phi_xi_k (t) = e^(-sigma_k^2 t^2/2) e^(i a_k t).
  $
  Получаем
  $
    phi_xi (t) = underbrace(e^(i a_0 t) dot e^(i a_1 c_1 t) dot e^(i a_2 c_2 t) dot ... dot e^(i a_n c_n t), e^(i a t)) dot underbrace(e^(-sigma_1^2 c_1^2 t^2/2) dot e^(-sigma_2^2 c_2^2 t^2/2) dot ... dot e^(-sigma_n^2 c_n^2 t^2/2), e^(-sigma^2 t^2 / 2)) =
    e^(i a t) dot e^(-sigma^2 t^2 / 2) = phi_eta (t).
  $
  Значит $eta sim Nn (a, sigma^2)$.
]
