#import "../../utils/core.typ": *

== Сходимость последовательности случайных величин

#th[
    $xi_1$, $xi_2$, ... --- последовательность независимых случайных величин. Пусть $f_i: RR^(n_i) --> RR$ измеримы относительно борелевской $sigma$-алгебры. Тогда случайные величины
    $f_1(xi_1, xi_2, ... xi_(n_1))$, $f_2(xi_(n_1 + 1), xi_(n_1 + 2), ..., xi_(n_1+n_2))$, ... независимы.
]

#proof[
    Докажем для пары кусочков последовательностей $xi_1, xi_2, ..., x_m$ и $eta_1, eta_2, ..., eta_n$ независимых, $f: RR^m --> RR$, $g: RR^n --> RR$. Хотим доказать, что $f(xi_1, ..., xi_m)$ и $g(eta_1, ..., eta_n)$ независимы. Пусть $A$ и $B$ --- борелевские множества. Тогда надо доказать, что
    $
        {f(xi_1, ..., xi_m) in A}, {g(eta_1, ..., eta_m) in B}
    $
    независимы. Равносильно,
    $
        {(xi_1, ..., xi_m) in f^(-1) (A)}, {(eta_1, ..., eta_n) in g^(-1) (B)}
    $ независимы, или
    $
        P(arrow(xi) in f^(-1) (A)) dot P(arrow(eta) in g^(-1) (B)) = P((arrow(xi), arrow(eta)) in f^(-1) (A) times g^(-1) (B)) newline(<==>)
        P_(arrow(xi)) (f_1^(-1) (A)) dot P_(arrow(eta)) (g^(-1) (B)) = P_(arrow(xi), arrow(eta)) (f^(-1) (A) times g^(-1) (B))
    $
    Это верно, так как
    $
        P_(arrow(xi)) &= P_(xi_1) times ... times P_(xi_m),\
        P_(arrow(eta)) &= P_(eta_1) times ... times P_(eta_n),\
        P_(arrow(xi), arrow(eta)) &= P_xi_1  times ... times P_(xi_m) times P_(eta_1) times ... times P_(eta_n).
    $
]

#def[
    Пусть $xi_1, xi_2, ..., xi : Omega --> RR$ случайные величины. Будем говорить, что

    1. последовательность $xi_n$ _сходится к случайной величине $xi$ почти наверное_, если
        $
            P(lim xi_n = xi) = 1.
        $

    2. $xi_n$ _сходится к $xi$ в среднем порядка $r$_, если
        $
            E abs(xi_n - xi)^r -->_(n -> oo) 0.
        $
    
    3. $xi_n$ _сходятся к $xi$ по вероятности_, если для любого $eps > 0$,
        $
            P(abs(xi_n - xi) > eps) -->_(n -> oo) 0.
        $
    
    4. Если $xi_i: Omega_i --> RR$ (то есть каждая задана на своем вероятностном пространстве), то _$xi_n$ сходится к $xi$ по распределению_, если
        $
            F_(xi_n) (x) -->_(n -> oo) F_(xi) (x)
        $
        по всех точках непрерывности $F_(xi)$.
]

#th[
    #figure[
        #cetz.canvas({
            import cetz.draw: *

            rect((0, 0.3), (4, 1.8), name: "rect1")
            rect((-1, -1.8), (4, -0.3), name: "rect2")
            rect((6, -0.75), (10, 0.75), name: "rect3")
            rect((12, -0.75), (16, 0.75), name: "rect4")

            set-style(stroke: (thickness: 2pt), fill: black)

            line((to: "rect1.east", rel: (0.3, 0.0)), (to: "rect3.west", rel: (-0.3, 0.225)), mark: (end: ">"))
            line((to: "rect2.east", rel: (0.3, 0.0)), (to: "rect3.west", rel: (-0.3, -0.225)), mark: (end: ">"))
            line((to: "rect3.east", rel: (0.3, 0.0)), (to: "rect4.west", rel: (-0.3, 0.0)), mark: (end: ">"))

            content("rect1.center", align(center)[1. Сходимость \ почти наверное])
            content("rect2.center", align(center)[2. Сходимость в \ среднем порядка $r$])
            content("rect3.center", align(center)[3. Сходимость по \ вероятности])
            content("rect4.center", align(center)[4. Сходимость по \ распределению])
        })
    ]
]

#proof[
    - "$1==>3$": теорема Лебега из матана (вероятностная мера всегда конечна).

    - "$2==>3$": рассмотрим $P(abs(xi_n - xi) >= eps) = P(abs(xi_n - xi)^r >= eps^r) <= (E abs(xi_n - xi)^r) / eps^r --> 0$.

    - "$1cancel(==>)2$": (а значит и $3 cancel(==>) 2$) $Omega = [0, 1]$, $P = lambda_1$, $xi_n = n^(1/r) bb(1)_[0, 1/n]$ --- сходится почти наверное к $xi = 0$. Но $E xi_n^r = E(n bb(1)_[0, 1/n]) = 1 cancel(-->) 0$ --- значит 2 не выполняется.

    - "$2cancel(==>)1$": (а значит и $3cancel(==>)1$) $Omega = [0, 1]$, $P = lambda_1$. $xi = bb(1)_[0, 1]$, $xi_1 = bb(1)_[0, 1/2)$, $xi_2 = bb(1)_[1/2, 1)$, $xi_3 = bb(1)_[0, 1/3)$, ...
        и тогда 2 есть: $E bb(1)_[k/n, (k + 1)/n) = 1/n --> 0$, а 1 нет: в каждой точке сколь угодно далеко встречаются и $0$, и $1$.

    - "$3==>4$": ${xi_n > x} supset {xi > x + eps} sect {abs(xi_n - xi) < eps}$.  Взяв дополнения, ${xi_n <= x} subset {xi <= x + eps} union {abs(xi_n - xi) >= eps}$. Отсюда 
        $
            P(xi_n <= x) <= P(xi <= x+eps) + P(abs(xi_n - xi) >= eps) ==> F_(xi_n) (x) <= F_xi (x + eps) + P(abs(xi_n - n) <= eps) newline(==>)
            limsup F_(xi_n) (x) <= F_xi (x + eps) + underbrace(limsup P(abs(xi_n - xi) >= eps), 0) = F_xi (x + eps).
        $
        С другой стороны, ${xi_n <= x} supset {xi <= x - eps} sect {abs(xi_n - xi) < eps}$, откуда ${xi_n > x} subset {xi > x + eps} union {abs(xi_n - xi) >= eps}$, и
        $
            P(xi_n > x) <= P(xi > x - eps) + P(abs(xi_n - xi) >= eps) ==> F_(xi_n) (x) >= F_xi (x - eps) - P(abs(xi_n - xi) >= eps) newline(==>)
            liminf F_(xi_n) (x) >= F_xi (x - eps) - underbrace(limsup P(abs(xi_n - xi) >= eps), 0) = F_xi (x - eps).
        $
        Таким образом, $F_xi (x - eps) <= liminf F_xi_n (x) <= limsup F_xi_n (x) <= F_xi (x + eps)$. В точке непрерывности $F_xi$ это означает, что $F_xi_n --> F_xi$.
    - "$4cancel(==>)3$": в прямой формулировке не имеет смысла, но даже если определить случайные величины на одном пространстве --- это все равно не верно (примера не было).
]

#th(name: "закон больших чисел")[
    Пусть $xi_1$, $xi_2$, ... --- попарно некоррелированные случайные величины и $D xi_n <= M$. Тогда $ P(abs(S_n/n - E S_n/n) >= eps) --> 0, $ где $S_n = xi_1 + xi_2 + ... + xi_n$.
]

#proof[
    $D S_n = sum_(k = 1)^n D_(xi_k) <= n M$, так как величины некоррелированны. По неравентсву Чебышева,
    $
        P(abs(S_n/n - E S_n/n) >= eps) <= (D(S_n/n)) / eps^2 <= (D S_n)/(n^2 eps) <= (n M)/(n^2 eps) = M/(eps n) --> 0.
    $
]

#th(name: "закон больших чисел в форме Чебышева")[
    $xi_1, xi_2, ...$ независимы и одинаково распределены с конечной дисперсией. Тогда $S_n / n --> a$ по вероятности, где $a = E xi_1$.
]

#proof[
    ```coq
    Proof.
        apply big_number_law.
    Qed.
    ```
]

#follow(name: "закон больших чисел для схемы Бернулли")[
    Пусть имеется схема Бернулли с вероятностью успеха $p$. Тогда $S_n/n --> p$ по вероятности.
]

#th(name: "усиленный закон больших чисел")[
    Пусть $xi_1$, $xi_2$, ... --- независимые случайные величины, и их четвертый центральный момент $E (xi_k - E xi_k)^4$ ограничен. Тогда $S_n/n --> E S_n/n $ почти наверное (где $S_n := xi_1 + ... + xi_n$).
]

#proof[
    Пусть $eta_k := xi_k - E xi_k$, и $S_n - E S_n = eta_1 + eta_2 + ... + eta_n$. Надо доказать, что $ (eta_1 + eta_2 + ... + eta_n)/n --> 0 $ почти наверное, но теперь все матожидания нулевые. Давайте вообще считать, что в изначальной задаче все матожидания нулевые, и писать $xi$ вместо $eta$ как в оригинальной задаче.

    Итак, имеем $E xi_k = 0$, $E xi_k^4 <= C$, и надо доказать, что $S_n/n --> 0$ почти наверное. Для некоторого $eps$ положим $A_n = {abs(S_n/n) >= eps}$. Рассмотрим $A := Sect_(n = 1)^oo Union_(k = n)^oo A_k$ --- событие "случилось бесконечное количество событий $A_n$". Докажем, что $P(A) = 0$ по лемме Бореля-Кантелли. Достаточно проверить, что $sum_(n = 1)^oo P(A_n)$ сходится, а для этого достаточно проверить $P(A_n) = O(1/n^2)$.
    $
        P(A_n) = P((S_n/n)^4 >= eps^4) <=^"Марков" (E (S_n/n)^4)/eps^4 = (E S_n^4)/(n^4 eps^4).
    $
    Достаточно доказать, что $E S_n^4 = O(n^2)$. Посчитаем:
    $
        E (S_n^4) = E (xi_1 + xi_2 + ... + xi_n)^4 newline(=)
        sum E xi_k^4 + 6 sum_(i < k) E xi_i^2 xi_k^2 + 12 sum_(j < k \ i != j \ i != k) E xi_i^2 xi_j xi_k + 4 sum_(i != k) E xi_i^3 xi_k + 24 sum_(i < j < k < l) E xi_i xi_j xi_k xi_l newline(=)
        sum E xi_k^4 + 6 sum_(i < k) E xi_i^2 E xi_k^2 + 12 sum_(j < k \ i != j \ i != k) E xi_i^2 E xi_j E xi_k + 4 sum_(i != k) E xi_i^3 E xi_k + 24 sum_(i < j < k < l) E xi_i E xi_j E xi_k E xi_l newline(=)
        sum E xi_k^4 + 6 sum_(i < k) E xi_i^2 E xi_k^2.
    $
    Эта сумма оценивается сверху:
    $
        E xi_i^4 &<= C,\
        E xi_i^2 xi_j^2 &<=^"Коши-Буняковский" sqrt(E xi_i^4 E xi_j^4) <= C.
    $
    Значит
    $
        sum E xi_k^4 + 6 sum_(i < k) E xi_i^2 E xi_k^2 <= n C + 6 n^2 C = O(n^2).
    $
    Рассмотрим событие $A(eps) = Sect_(n = 1)^oo Union_(k = n)^oo A_k$. $P(A(eps)) = 0$ для любого $eps > 0$ (то есть то $eps$, который мы раньше рассматривали произвольным теперь рассматривается как параметр для множества $A$). Рассмотрим $B := Union_(m = 1)^oo A(1/m)$ и $P(B) = 0$.
    
    Пусть $omega in.not B$. Тогда $omega in.not A(1/m)$ для любого $m$, а значит $omega in.not A(eps)$ для любого $eps > 0$, и случилось лишь конечное число событий ${abs(S_n/n) >= eps}$, а тогда начиная с некоторого номера начинаются только обратные: $ omega in {abs(S_n/n) < eps} ==> abs((S_n (omega))/n) < eps ==> S_n/n -->_(n -> oo) 0. $
    Доказали.
]

#follow(name: "Усиленный закон больших чисел для схемы Бернулли")[
    Пусть $p$ --- вероятность успеха. Тогда $S_n/n --> p$ почти наверное.
]
#proof[
    $E xi_k = p$, а значит $E S_n = n p$. Надо проверить конечность четвертого центрального момента. Ну да, он конечен:
    $
        E (xi_k - p)^4 = E xi_k^4 + ... E xi_k^3 + ... E xi_k^2 + ... E xi_k + ...,
    $
    где под $...$ находятся какие-то конечные коэффициенты, а $E xi_k^n$ равно $p$, так как $xi_k$ --- либо $0$, либо $1$.
]

#example(name: "метод Монте-Карло")[
    Пусть $Phi$ --- тело в $RR^d$. Хотим найти его $n$-мерный объем, причем для каждой точки несложно проверить $x in Phi$ или $x in.not Phi$.

    Запихиваем $Phi$ в параллелепипед $[a, b]^d$. Кидаем в его случайную точку, и проверяем, лежит ли она в $Phi$. $xi_k$ --- попали ли мы в $Phi$ или нет. Тогда $S_n/n$ сходится к вероятности успеха попасть в $Phi$, а значит $(lambda_d Phi) / (lambda_d [a, b]^d)$.
]
