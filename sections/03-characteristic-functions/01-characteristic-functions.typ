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
      abs(phi_xi (t + h) - phi_xi (t)) <= E abs(e^(i t xi) (e^(i h xi) - 1)) <= E abs(e^(i t xi) - 1) -->^?_(h -> 0) 0.
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
