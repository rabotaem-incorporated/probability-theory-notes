#import "../../utils/core.typ": *

== Совместное распределение

#def[
    Вектор
    $ arrow(xi) = (xi_1, xi_2, ..., xi_n): Omega --> RR^n $
    является _совместным_ или _многомерным_ распределением если
    $P_(arrow(xi)) = P_(xi_1, xi_2, ..., xi_n)$ --- мера на борелевских подмножествах $RR^n$: $P_(arrow(xi)) (A) = P(arrow(xi) in A)$.
]

#notice[
    $P_arrow(xi)$ однозначно определяет $P_xi_1, P_xi_2$, ..., $P_xi_n$, но не наоборот.
    
    Определяет, так как если взять $B in RR$ борелевское, то $P_xi_1 (B) = P_(arrow(xi)) (B times RR^(n - 1))$.

    Не наоборот, так как можно, например, рассмотреть $xi_1, xi_2: Omega --> {0, 1}$ --- подбрасывания правильной монетки. Пусть $(xi_1, xi_2): Omega --> {(0, 0), (0, 1), (1, 0), (1, 1)}$, все по $1/4$ --- тогда подбрасывания независимы, и $P_xi_1 = 1/2$, $P_xi_2 = 1/2$. Теперь пусть $xi_1 = xi_2$, то есть подбрасывание одно. Тогда $P_xi_1 = 1/2$, $P_xi_2 = 1/2$. Восстановить $arrow(xi)$ не получается.
]

#def[
    Случайные величины $xi_1$, $xi_2$, ..., $xi_n$ независимы, если для любых $A_1$, $A_2$, ..., $A_n$ борелевских подмножеств $RR$,
    $
        P(xi_1 in A_1, xi_2 in A_2, ..., xi_n in A_n) = P(xi_1 in A_1) P(xi_2 in A_2) ... P(xi_n in A_n).
    $ 
    Или, эквивалентно, события $xi_1 in A_1$, $xi_2 in A_2$, ..., $xi_n in A_n$ независимы. Так как мы можем выбирать $A_i$ как хотим, мы можем не делать оговорку о том, что это также должно быть верно по всем подмножествам индексов.
]

#th[
    $xi_1$, $xi_2$, ..., $xi_n$ --- независимы тогда и только тогда, когда $P_(arrow(xi)) = P_xi_1 P_xi_2 ... P_xi_n$.
]

#proof[
    - "$==>$": $P(xi_1 in A_1, ..., xi_n in A_n) = P(xi_1 in A) dot ... dot P(xi_n in A)$. Причем,
        $
            P(xi_1 in A_1, ..., xi_n in A_n) =
            P_(arrow(xi)) (A_1 times ... times A_n).
        $
        и
        $
            P(xi_1 in A) dot ... dot P(xi_n in A) =
            P_xi_1 (A_1) dot ... dot P_xi_n (A_n).
        $
        Значит на измеримых прямоугольниках меры $P_(arrow(xi))$ и $P_xi_1 P_xi_2 ... P_xi_n$ совпадают, а значит они совпадают и на всем пространстве.
    - "$<==$": Из того, что есть равенство мер, следует равенство мер на прямоугольниках, то есть независимость.
]

#def[
    _Совместная (многомерная) функция распределения_:
    $
        F_(arrow(xi)): RR^n &--> [0, 1],\
        F_(arrow(xi)) (arrow(x)) &:= P(xi_1 <= x_1, xi_2 <= x_2, ..., xi_n <= x_n).
    $
]

#props[
    1. $0 <= F_(arrow(xi)) <= 1$
    2. $lim_(x_k -> -oo) F_(arrow(xi)) (arrow(x)) = 0$
    3. $lim_(x_1, ..., x_n -> +oo) F_(arrow(xi)) (arrow(x)) = 1$
    4. Если $x_1 <= y_1$, ..., $x_n <= y_n$, то $F_(arrow(xi)) (arrow(x)) <= F_(arrow(xi)) (arrow(y))$.
]

#proof[
    1. Очевидно.
    2. Проверяем на последовательностях:
        $x_1^((m)) -->_(m -> oo) -oo$.
        $
            F_(arrow(xi)) (x_1^((m)), x_2, ..., x_n) =
            P(xi_1 <= x_1^((m)), xi_2 <= x_2, ..., xi_n <= x_n)
            newline(-->^"непр. меры\nсверху")
            P_(arrow(xi)) (Sect_(m = 1)^oo {xi_1 <= x_1^((m)), xi_2 <= x_2, ..., xi_n <= x_n}) = P(nothing) = 0.
        $
    3. Аналогично.
    4. Очевидно.
]

#def[
    _Совместная (многомерная) плотность распределения_ --- функция $p_arrow(xi) (t) >= 0$, такая что
    $
        F_(arrow(xi)) (arrow(x)) = integral_oo^(x_1) ... integral_oo^(x_n) p_arrow(xi) (t_1, ..., t_n) dif t_n ... dif t_1.
    $
]

#follow(name: "из теоремы")[
    1. $xi_1$, $xi_2$, ..., $xi_n$ --- независимы тогда и только тогда, когда $F_(arrow(x)) (arrow(x)) = F_(xi_1) (x_1) ... F_(xi_n) (x_n)$.
    2. Пусть $xi_1$, ..., $xi_n$ абсолютно непрерывны. Тогда
        $
            xi_1, ..., xi_n "независимы" <==> p_(arrow(xi)) (t) = p_(xi_1) (t_1) ... p_(xi_n) (t_n),
        $
        причем абсолюная непрерывность и независимость гарантируют наличие совместной плотности.
]

#proof[
    1. 
        - "$==>$": 
            $
                F_(arrow(xi)) =
                P_arrow(xi) ((-oo, x_1] times (-oo, x_2] times ... times (-oo, x_n]) newline(=)
                P_xi_1 (-oo, x_1] dot ... dot P_(xi_n) (-oo, x_n] =
                F_xi_1 (x_1) dot ... dot F_(xi_n) (x_n).
            $
        - "$<==$":
            Знаем совпадение мер на $(-oo, x_1] times ... times (-oo, x_n]$, хотим доказать совпадение на ячейках. Пусть, для простоты, $n = 2$. Тогда
            $
                P_(xi, eta) ((a, b] times (c, d]) &newline(=)
                P_(xi, eta) ((-oo, b] times (-oo, d]) -
                P_(xi, eta) ((-oo, b] times (-oo, c]) &-\
                P_(xi, eta) ((-oo, a] times (-oo, d]) +
                P_(xi, eta) ((-oo, a] times (-oo, c]) newline(=)
                F_(xi, eta) (b, d) - F_(xi, eta) (b, c) - F_(xi, eta) (a, d) + F_(xi, eta) (a, c) &newline(=)
                F_xi (b) F_eta (d) - F_xi (b) F_eta (c) - F_xi (a) F_eta (d) + F_xi (a) F_eta (c) &newline(=)
                (F_xi (b) - F_xi (a)) (F_eta (d) - F_eta (c)) &newline(=)
                P_xi (a, b] P_eta (c, d].
            $
            Значит меры совпадают на ячейках. Отсюда независимость.

            Аналогично это делается в общем виде ($n > 2$), но букв будет больше. Короче, в любом случае не трудно.

    2.
        - "$==>$": $F_arrow(xi) (arrow(x)) = F_(xi_1) (x_1) ... F_(xi_n) (x_n)$.
            Докажем, что $p(arrow(t)) = p_(xi_1) (t_1) ... p_(xi_n) (t_n)$ --- совместная плотность.
            $
                integral_oo^(x_1) ... integral_oo^(x_n) p_arrow(xi) (t_1, ..., t_n) dif t_n ... dif t_1 =
                integral_oo^(x_1) ... integral_oo^(x_n) p_(xi_1) (t_1) dot ... dot p_(xi_n) (t_n) dif t_n ... dif t_1 newline(=)
                integral_oo^(x_1) p_(xi_1) (t_1) dif t_1 dot ... dot integral_oo^(x_n) p_(xi_n) (t_n) dif t_n =
                F_(xi_1) (x_1) dot ... dot F_(xi_n) (x_n) =^"независимость" F_(arrow(xi)) (arrow(x)).
            $
        - "$<==$": так же, равенства те же.
]

=== Отступление в теорию меры. Свертка мер.

#def[
    Пусть $mu$, $nu$ --- конечные меры на борелевских подмножествах $RR$. _Свертка_ мер $mu$ и $nu$ --- это мера $mu * nu$ на $RR$, такая что
    $
        mu * nu (A) = integral_RR mu (A - y) dif nu (y).
    $
]

#props[
    1. $mu * nu (A) = integral_(RR^2) bb(1)_A (x + y) dif mu(x) dif nu(y)$.
    2. $mu_1 * mu_2 * ... * mu_n (A) = integral_(RR^n) bb(1)_A (x_1 + ... + x_n) dif mu_1 (x_1) ... dif mu_n (x_n)$.
    3. $mu * nu = nu * mu$.
    4. $mu_1 * (mu_2 * mu_3) = (mu_1 * mu_2) * mu_3$.
    5. $(c mu) * nu = c dot mu * nu$
    6. $(mu_1 + mu_2) * nu = mu_1 * nu + mu_2 * nu$.
    7. $mu * delta_0 = mu$, где $delta_0$ --- мера с _единичной нагрузкой в нуле_, то есть
        $
            delta_0 (A) = cases(0 "если" 0 in.not A, 1 "если" 0 in A).
        $
]

#proof[
    1.
        $
            mu * nu (A) =
            integral_RR mu (A - y) dif nu (y) =
            integral_RR integral_RR bb(1)_(A - y) (x) dif mu (x) dif nu (y) =
            integral_(RR^2) bb(1)_A (x + y) dif mu(x) dif nu(y).
        $
    2. Аналогично + индукция.
    3. Очевидно.
    4. Очевидно.
    5. Очевидно.
    6. Очевидно.
    7. 
        $
            mu * delta_0 (A) = delta_0 * mu (A) = integral_RR delta_0 (A - y) dif mu(y) = integral_RR bb(1)_A (y) dif mu (y) = mu (A).
        $
]

#th[
    Пусть $mu$ и $nu$ --- меры с плотностями $p_mu$ и $p_nu$ относительно меры Лебега. Тогда $mu * nu$ --- мера с плотностью 
    $ 
        p(t) := integral_RR p_mu (t - s) dot p_nu (s) dif s.
    $
]

#proof[
    Надо доказать, что $mu * nu (A) = integral_A p(t) dif t$, то есть
    $
        mu * nu (A) =
        integral_(RR^2) bb(1)_A (x + y) dif mu(x) dif nu(y) =^?
        integral_(RR^2) bb(1)_A (t) dot p_mu (t - s) dot p_nu (s) dif s dif t newline(=)
        integral_A integral_RR p_mu (t - s) dot p_nu (s) dif s dif t =
        integral_A p(t) dif t.
    $
    Преобразуем второй интеграл:
    $
        integral_(RR^2) bb(1)_A (t) dot p_mu (t - s) dot p_nu (s) dif s dif t =
        integral_(RR^2) bb(1)_A (t) dot p_mu (t - s) dot p_nu (s) dif t dif s newline(=^(u = t - s))
        integral_(RR^2) bb(1)_A (u + s) dot p_mu (u) dot p_nu (s) dif u dif s =
        integral_(RR^2) bb(1)_A (u + s) dif mu(u) dif nu(s).
    $
]

=== Отступление закончилось, возвращаемся к теорверу (это не следует делать подзаголовком, не так ли?)

#th[
    Если $xi$, $eta$ независимы, то $P_(xi + eta) (t) = P_(xi) * P_(eta) (t)$.
]

#proof[
    Пусть $B subset RR^2$ такое, что $(x, y) in B$ тогда и только тогда, когда $x + y in A$
    $
        P_(xi + eta) (t) = P(xi + eta in A) = P ((xi, eta) in B)) = P_(xi, eta) (B) = integral_(RR^2) bb(1)_B (x, y) dif P_(xi, eta) (x, y) newline(=)
        integral_(RR^2) bb(1)_A (x + y) dif P_(xi) (x) dif P_(eta) (y) = P_(xi) * P_(eta) (t).
    $
]

#examples[
    1. Свертка с дискретным распределением:
        пусть
        $
            delta_x (A) = cases(0 "если" x in.not A, 1 "если" x in A),
        $
        и $nu = sum c_k delta_(x_k)$ --- дискретная мера. Тогда
        $
            mu * nu (A) = integral_RR (mu (A - y)) dif nu (y) = sum c_k mu (A - x_k).
        $
    2. $xi_i sim op("Poisson") (lambda_i)$, $xi_1$ и $xi_2$ независимы. Тогда
        $
            P_(xi_i) = sum_(k = 0)^oo (lambda_i^k dot e^(-lambda))/(k!),
        $
        и
        $
            P_(xi_1 + xi_2)({n}) = P_(xi_1) * P_(xi_2) ({n}) =
            sum_(k = 0)^oo P_(xi_1) ({n - k}) dot (lambda_2^k e^(-lambda_2))/(k!) =
            sum_(k = 0)^n (lambda_1^(n - k) e^(-lambda_1))/(n - k)! dot (lambda_2^k e^(-lambda_2))/k! newline(=)
            e^(-lambda_1 - lambda_2)/n! sum_(k = 0)^n C_n^k lambda_1^(n - k) lambda_2^k =
            e^(-lambda_1 - lambda_2)/n! (lambda_1 + lambda_2)^n.
        $
]

#exercise(plural: true)[
    1. Пусть $xi_1, xi_2 sim op("Exp") (1)$ и независимы. Найти распределение $xi_1 + xi_2$.
    2. Пусть $xi_i sim Nn(a_i, sigma_i^2)$ независимы. Доказать, что $xi_1 + xi_2 sim Nn (a_1 + a_2, sigma_1^2 + sigma_2^2)$.
]
