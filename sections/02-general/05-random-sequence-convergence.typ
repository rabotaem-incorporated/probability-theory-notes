#import "../../utils/core.typ": *

== Сходимость последовательности случайных величин

#th[
    $xi_1$, $xi_2$, ... --- последовательность независимых случайных величин. Пусть $f_i: RR^(n_i) --> RR$ измеримы относительно борелевской $sigma$-алгебры. Тогда случайные величины
    $f_1(xi_1, xi_2, ... xi_(n_1))$, $f_2(xi_(n_1 + 1), xi_(n_1 + 2), ..., xi_(n_1+n_2))$, ... независимы.
]

#proof[
    Докажем для пары кусочков последовательностей $xi_1, xi_2, ..., x_m$ и $eta_1, eta_2, ..., eta_n$ независимы, $f: RR^m --> RR$, $g: RR^n --> RR$. Хотим доказать $f(xi_1, ..., xi_m)$ и $g(eta_1, ..., eta_n)$ независимы. Пусть $A$ и $B$ --- борелевские множества. Тогда надо доказать, что
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
    #TODO[картинка андрея]
]

#proof[
    - "$1==>3$": теорема Лебега из матана.

    - "$2==>3$": рассмотрим $P(abs(xi_n - xi) >= eps) = P(abs(xi_n - xi)^r >= eps^r) <= (E abs(xi_n - xi)^r) / eps^r --> 0$.

    - "$1cancel(==>)2$": (а значит и $3 cancel(==>) 2$) $Omega = [0, 1]$, $P = lambda_1$, $xi_n = n^(1/r) bb(1)_[0, 1/n]$ --- сходится почти наверное к $xi = 0$. Но $E xi_n^r = E(n bb(1)_[0, 1/n]) = 1 cancel(-->) 0$ --- значит 2 не выполняется.

    - "$2cancel(==>)1$": (а значит и $3cancel(==>)1$) $Omega = [0, 1]$, $P = lambda_1$. $xi = bb(1)_[0, 1]$, $xi_1 = bb(1)_[0, 1/2)$, $xi_2 = bb(1)_[1/2, 1/3)$, ...
        и тогда 2 есть: $E bb(1)_[k/n, (k + 1)/n) = 1/n --> 0$, а 1 нет: в каждой точке сколь угодно далеко встречаются и $0$, и $1$.

    - "$3==>4$": ${xi_n > x} supset {xi > x + eps} sect {abs(xi_n - xi) < eps}$.  Взяв дополнения, ${xi_n <= x} subset {xi <= x + eps} union {abs(xi_n - xi) >= eps}$. Отсюда 
        $
            P(xi_n <= x) <= P(xi <= xi+eps) + P(abs(xi_n - xi) >= eps) ==> F_(xi_n) (x) <= F_xi (x + eps) + P(abs(xi_n - n) <= eps) newline(==>)
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
    $xi_1, xi_2, ...$ независимы и одинаково распределны с конечной дисперсией. Тогда $S_n / n --> a$ по вероятности, где $a = E xi_1$.
]

#proof[
    ```coq
    Proof.
        apply big_number_law.
    Qed.
    ```
]

#follow(name: "закон больших чисел для схемы Бернулли")[
    Пусть имеется схема Бернулли с вероятностью успеха $p$. Тогда $S_n/n --> p$.
]
