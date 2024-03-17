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
    *Шаг 2*. По линейности верно для простых.

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

#follow(name: "неравентсво Маркова (неравенство Чебышева из матана (не путать с неравенством Чебышева из теорвера (это неравенство там называется неравенством Маркова, то есть вот этим, а это другое)))")[
    Если $xi > 0$, $p, t > 0$. Тогда
    $
        P(xi >= t) <= (E xi^p) / t^p.
    $
]

#notice[
    $E (xi eta) = E xi dot E eta$ может быть неверно без независимости. Например, если $xi = plus.minus 1$ с вероятностями $1/2$, то $E xi = 0$, а $E xi xi = 1 != E xi dot E xi$.
]

#def[
    _Медианой случайной величины_ $xi$ называется число $m$ такое, что
    $
        P(xi >= m) >= 1/2 "и " P(xi <= m) <= 1/2.
    $
]

#notice[
    Медиана не единственна. Например, если $xi$ --- результат подбрасывания правильного кубика, то медиана $xi$ --- любое число на отрезке $[3, 4]$.

    Обычно, если медиана не единственна, выбирают середину отрезка (понятно, что множество всех медиан всегда является отрезком).
]

#notice[
    Если $F$ --- функция распределения $xi$, то медиана $xi$ --- это $F^(-1)(1/2)$. Если в $1/2$ функция не обратима, то медиана --- любое число вокруг, а если $F$ непрерывна, то медиана --- единственна.
]

#example[
    Пусть у нас есть _контора_, в которой работает 1000 человек. В ней 999 человек получают \$1000,  и есть начальник, который получает \$1000000. Тогда если равновероятно выбрать случайного человека в конторе и рассмотреть его зарплату $xi$, то
    $
        E xi &= 999/1000 * 1000 + 1/1000 * 10^6 = 999 + 1000 = 1999.\
        m xi &= 1000.
    $
    Понятно, что для типичного работяги $E xi$ не отражает ситуацию, потому что большинство людей получают мало, а один человек получает очень много. Поэтому в таких ситуациях лучше смотреть на медиану.
]

#def[
    _Дисперсия случайной величины_, $D xi$ или $op("Var") eps$, это
    $
        D xi = E (xi - E xi)^2.
    $
]

#props[
    1. $D xi >= 0$, и $D xi = 0$ тогда и только тогда, когда $xi = a$ почти наверное.
    2. $D xi = E xi^2 - (E xi)^2$.
    3. $D(xi + c) = D xi$.
    4. $D(c xi) = c^2 D xi$, и в частности, $D xi = D(-xi)$.
    5. Если $xi$ и $eta$ независимы, то $D(xi + eta) = D xi + D eta$.
    6. Если $xi_1, xi_2, ..., xi_n$ попарно независимы, то $D(xi_1 + xi_2 + ... + xi_n) = D xi_1 + D xi_2 + ... + D xi_n$.
    7. $E abs(xi - E xi) <= sqrt(D xi)$.
]

#proof[
    Пусть $a = E xi$.
    1. Очевидно, $D xi = E (xi - a)^2 >= 0$.
    2. $D_xi = E(xi - a)^2 = E xi^2 - 2 a E xi + a^2 = E xi^2 - a^2$.
    3. $D(xi + c) = E (xi + c - a - c)^2 = E (xi - a)^2 = D xi$.
    4. $D(c xi) = E (c xi - c a)^2 = c^2 E (xi - a)^2 = c^2 D xi$.
    5. $D(xi + eta) = E(xi + eta)^2 - (E(xi + eta))^2 = E xi^2 + 2E(xi eta) + E eta^2 - (E xi)^2 - 2E xi E eta - (E eta)^2 = E xi^2 + E eta^2 - (E xi)^2 - (E eta)^2 = D xi + D eta$.
    6. Аналогично.
    7. $E abs(xi - E xi) <= sqrt(E abs(xi - E_xi)^2)$ (неравентсво Ляпунова).
]

#th(name: "неравенство Чебышева (не путать с неравентсвом Чебышева из матана, где оно про другое (а в теорвере это неравентсво Маркова (и вот это неравенство Чебышева из матана (не путать с этим неравенством Чебышева из теорвера (это неравенство там называется неравенством Маркова, а это из него следует))))")[
    Для любого $t > 0$ верно
    $
        P(abs(xi - E xi) >= t) <= (D xi) / t^2.
    $
]
#proof[
    $
        P(abs(xi - E xi) >= t) <=^"Марков" (E abs(xi - E xi)^2)/t^2 = (D xi) / t^2.
    $
]

#examples[
    1. $xi sim U[0, 1]$
        $
            E xi &= integral_RR x dif P_xi (x) = integral_0^1 x dif x = lr(x^2/2 |)_0^1 = 1/2,\
            E xi^2 &= integral_0^1 x^2 dif x = lr(x^3/3 |)_0^1 = 1/3,\
            D xi &= E xi^2 - (E xi)^2 = 1/3 - 1/4 = 1/12.
        $
    2. $xi sim U[a, b]$. Знаем, что если $eta sim [0, 1]$, то $xi = (b - a)eta + a sim U[a, b]$.
        $
            E xi = E ((b - a)eta + a) = (b - a)E eta + a = (b - a)/2 + a = (a + b)/2,\
            D xi = D ((b - a)eta + a) = (b - a)^2 D eta = (b - a)^2/12.
        $
    3. $xi sim Nn(0, 1)$.
        $
            E_xi =&
            integral_RR x dif P_xi (x) =
            1/sqrt(2pi) integral_RR x e^(-x^2/2) dif x = 0,\
            D xi =&
            E xi^2 =
            1/sqrt(2pi) integral_RR x^2 e^(-x^2/2) dif x =
            1/sqrt(2pi) (lr(x e^(-x^2/2)|)_(-oo)^(+oo) + integral_RR e^(-x^2/2) dif x) newline(=) &1/sqrt(2pi) (0 + integral_RR e^(-x^2/2) dif x) = 1/sqrt(2pi) sqrt(2pi) = 1.
        $
    4. $xi sim Nn(a, sigma^2)$. Знаем, что если $nu sim Nn(0, 1)$, то $xi = a + sigma nu sim Nn(a, sigma^2)$.
        $
            E xi = E (a + sigma nu) = a + sigma E nu = a,\
            D xi = D (a + sigma nu) = sigma^2 D nu = sigma^2.
        $
]

#def[
    _Моменты случайных величин_:
    - $E xi^p$ --- _$p$-й момент случайной величины_.
    - $E abs(xi)^p$ --- _$p$-й абсолютный момент_.
    - $E (xi - E xi)^p$ --- _$p$-й центральный момент_.
    - $E abs(xi - E xi)^p$ --- _$p$-й абсолютный центральный момент_.

    В частности, $D xi$ --- второй центральный момент.
]

#def[
    _Ковариацией_ случайных величин $xi$ и $eta$ называется
    $
        cov (xi, eta) = E (xi - E xi) (eta - E eta).
    $
    Здесь необходимо, чтобы интеграл под математическим ожиданием существовал. В отличие от дисперии, где он в худшем случае бесконечность, здесь он может быть и неопределен.
]

#props[
    1. $cov(xi, xi) = D xi$.
    2. $cov(xi + c, eta) = cov(xi, eta)$.
    3. $cov(c xi, eta) = c cov(xi, eta)$.
    4. $cov(xi_1 + xi_2, eta) = cov(xi_1, eta) + cov(xi_2, eta)$. 
    5. $cov(xi, eta) = E (xi eta) - E xi dot E eta$.
    6. Если $xi$ и $eta$ независимы, то $cov(xi, eta) = 0$. Обратное не верно.
    7. $D(xi + eta) = D xi + D eta + 2 cov (xi, eta)$.
    8. $D(sum_(k = 1)^n xi_k) = sum_(i = 1)^n sum_(j = 1)^n cov(xi, eta) = sum_(k = 1)^n D xi_k + 2 sum_(i < j) cov(xi_i, xi_k)$.
]

#proof[
    Все очев.
    5. Если $a = E xi$, $b = E eta$, то $cov(xi, eta) = E (xi - a) (eta - b) = E (xi eta) - a E eta - b E xi + a b = E(xi eta) - a b$.
]

#notice[
    В 6-м свойстве обратное не верно. Пусть $Omega = {0, pi/2, pi}$, с вероятностями по $1/3$. Рассмотрим $xi(omega) = sin omega$, $eta(omega) = cos omega$. Тогда
    $
        E eta &= (1 + 0 + (-1))/3 = 0,\
        E xi eta &= (0 + 0 + 0)/3 = 0,\
        E xi &= (0 + 1 + 0)/3 = 1/3,\
        cov (xi, eta) &= E xi eta - E xi E eta = 0 - 0 = 0.
    $
    Однако независимости нет. Например, $P(xi = 1, eta = 1) = 0$, но $P(xi = 1) P(eta = 1) = 1/9$.
]

#def[
    _Коэффициент корреляции_ случайных величин $xi$ и $eta$ --- это
    $
        rho (xi, eta) = (cov (xi, eta) )/ (sqrt(D xi) sqrt(D eta)).
    $
]

#notice[
    $rho(xi, eta) in [-1, 1]$, так как
    $
        abs(cov(xi, eta)) = abs(E (xi - E xi) (eta - E eta)) <= E abs(xi - E xi) abs(eta - E eta) <= sqrt(D xi) sqrt(D eta).
    $
]

#def[
    Если $rho(xi, eta) = 0$ (или, что то же самое, $cov(xi, eta) = 0$), то $xi$ и $eta$ называют _некоррелированными_. Иногда в задачах требуют это свойство, так как оно слабее независимости.
]

#exercise[
    Доказать, что если $rho(xi, eta) = 1$, то $xi$ и $eta$ --- линейно зависимы, то есть $eta = a xi + b$ почти наверное для некоторых $a, b in RR$, причем знак $a$ равен знаку $rho(xi, eta)$.
]

#example(name: "Выбор двудельного подграфа")[
    Пусть $G = (V, E)$ --- граф из $n$ вершин и $m$ ребер. Тогда можно стереть не более $<= m/2$ ребер так, что останется двудольный подграф.
]

#proof[
    Рассмотрим схему Бернулли на вершинах. Если успех, то отправляем вершину в одну долю ($T$), иначе в другую ($V without T$). Рассмотрим $xi_(x y) = 0$ если $x$ и $y$ из разных долей, и $1$ иначе. Пусть
    $
        xi = sum_(x y in E) xi_(x y)
    $
    --- количество ребер внутри долей $T$ и $V without T$. Тогда матожидание $xi$:
    $
        E_xi = sum_(x y in E) E xi_(x y) = sum_(x y in E) P(xi_(x y) = 1) = sum_(x y in E) P(x "и " y "в одной доли") = sum_(x y in E) 1/2 = m/2. 
    $
    Значит, есть реализация, в которой $xi <= m/2$.
]

#exercise[
    Доказать, что если $n$ четно, то сущесвует такой выбор долей, что ребер между ними хотя бы $(m n)/(2 (n - 1))$.
]

#notice[
    Геометрический смысл происходящего.

    Рассмотрим случайные величины с конечным вторым моментом. Тогда
    1. $E (xi nu) =: dotp(xi, eta)$ --- скалярное произведение. Едиснтвенное, надо отождествить равные почти наверное случайные величины, иначе из того, что скалярное произведение величины с собой не обязательно следует то, что она равна $0$.
        Матожидание тогда --- проекция на ось констант. Действительно, $dotp(xi - E xi, a) = a E(xi - E xi) = 0$
    2. $cov(xi, nu) =: dotp(xi, eta)$ --- тоже скалярное произведение. Едиснтвенное, надо отождествить случайные величины отличающиеся на константу почти наверное (так как для таких случайных величин не следует, что они равны). Тогда $sqrt(D xi)$ --- норма.
 
]