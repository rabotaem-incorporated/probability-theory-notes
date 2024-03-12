#import "../../utils/core.typ": *

== Математическое ожидание и дисперсия

#def[
    Пусть $xi$ --- случайная величина такая, что $xi >= 0$ или $xi$ --- суммируемая функция. _Математическим ожиданием_ или _средним значением случайной величины_ $E xi$ называется
    $
        E xi = integral_Omega xi (omega) dif P(omega).
    $
]

#props[
    1. $E xi = integral_RR x dif P_xi (x)$.
    2. Линейность: $E (a xi + b eta) = a E xi + b E eta$#footnote[как обычно нужны оговорки про то, что мы должны уметь вычитать, иначе можем из бесконечности вычесть бесконечность и умереть].
    3. Если $xi >= 0$, то $E xi >= 0$.
    4. Если $xi <= eta$, то $E xi <= E eta$.
    5. $f: RR^n --> R$ измерима относительно борелевской оболочки $sigma$-алгебры. Тогда
        $ E f(xi_1, xi_2, ..., xi_n) = integral_(RR^n) f(x_1, ..., x_n) dif P_(arrow(xi)) (arrow(x)). $
]

#proof[
    Доказываем свойство 5, потому что 1 --- частный случай 5, а остальные очевидны.

    *Шаг 1*. Пусть $f = bb(1)_A$. Тогда 
        $ 
            E bb(1)_A (arrow(xi)) =
            P(arrow(xi) in A) =
            P_(arrow(xi)) (A) =
            integral_(RR^n) bb(1)_A (x) dif P_(arrow(xi)) (x).
        $
    *Шаг 2*. По линейности, верно для простых.

    *Шаг 3*. Если $f >= 0$, возьмем $f_1 <= f_2 <= ...$ последовательность простых.
    $
        integral_Omega f (arrow(xi) (omega)) dif P(omega) <--
        integral_Omega f_n (arrow(xi) (omega)) dif P(omega) =
        E(f_n (arrow(xi))) =
        integral_(RR^n) f_n (arrow(x)) dif P_(arrow(xi)) (arrow(x)) -->
        integral_(RR^n) f (arrow(x)) dif P_(arrow(xi)) (arrow(x)).
    $
    *Шаг 4*. $f = f_+ - f_-$ и готово.
]

#props[
    6. Если $xi$ и $eta$ независимы, то $E(xi eta) = E xi dot E eta$.
]
#proof[
    $
        E(xi eta) =
        integral_(RR^2) x y dif P_(xi, eta) (x, y) =
        integral_(RR^2) x y dif P_xi (x) dif P_eta (y) =
        integral_RR x dif P_xi (x) integral_RR y dif P_eta (y) =
        E xi dot E eta.
    $
]

#props[
    7. При $xi >= 0$, $E xi = integral_0^(+oo) P (xi >= t) dif t = integral_RR x dif P_(arrow(xi)) (x)$.

    8. _Неравентсво Гельдера_: $ E (xi eta) <= (E xi)^(1/p) (E eta)^(1/q), $ где $1/p + 1/q = 1$ и $p, q >= 1$.

    9. _Неравентсво Ляпунова_: при $0 < r < s$,
        $ 
            (E abs(xi)^r)^(1/r) <= (E abs(xi)^s)^(1/s).
        $
]

#proof[
    7. Очевидно.

    8. Уже доказывали на матане.

    9. Пусть $eta = 1$, $p = s/r$. Тогда
        $
            E (abs(xi)^r dot 1) <= ((E abs(xi)^r)^p)^(1/p) dot (E 1^s)^(1/s) = (E abs(xi)^s)^(r/s).
        $
]
