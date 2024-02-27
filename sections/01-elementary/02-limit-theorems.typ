#import "../../utils/core.typ": *

== Предельные теоремы для схем Бернулли

#example[
    Пусть $S_n$ --- количество успехов в схеме Бернулли с $n$ испытаниями.
    
    Что больше
    $
        P(S_1000 = 220) "при" p = 1/5, "или" P(S_2000 = 360) "при" p = 1/6?
    $
    Их можно вычислить, но это очень тяжело. Первое выражение равняется $C_2000^360 dot (1/6)^360 dot (5/6)^(2000 - 360) approx 0.006625$, а вторая $approx 0.00894$. Мы приведем более простой способ решения этой задачи.
]

#th(name: "Пуассона")[
    Рассмотрим последовательность схем Бернулли с $n$ испытаниями и вероятностью успеха $p_n$, такую что $n p_n --> lambda > 0$. Тогда
    $
        P(S_n = k) -->_(n -> oo) (lambda^k)/(k!) e^(-lambda).
    $
]

#proof[
    $
        P(S_n = k) = C_n^k p_n^k (1 - p_n)^(n - k) sim C_n^k lambda^k/n^k (1 - p^n)^(n - k) newline(=)
        (n dot (n - 1) dot ... dot (n - k + 1))/(k!) lambda^k / (n^k) (1 - p_n)^(n - k) sim
        lambda^k / (k!) (1 - p_n)^(n - k) sim lambda^k / (k!) e^(-lambda).
    $
    Последний переход верен потому что $(1 - p_n)^(n - k) sim (1-p_n)^n$, и
    $
        n ln(1 - p_n) = n ln(1 - lambda/n + o(1/n)) sim n (-lambda/n + o(1/n)) = -lambda + o(1).
    $
]

#notice[
    Если $p_n = lambda/n$, то $P(S_n = k) sim lambda^k / (k!) e^(-lambda)$ при $k = o(sqrt(n))$.
]

#proof[
    Надо понять, что
    $
        (n dot (n - 1) dot ... (n - k + 1))/(n^k) --> 1.
    $
    Это верно, потому что
    $
        1 <-- 1 - (k (k - 1))/ (2n) = 1 - 1/n - 2/n - ... - (k - 1)/n <=^* 1 dot (1 - 1/n) dot ... dot (1 - (k - 1)/n) <= 1,
    $
    а неравенство $*$ выполняется, потому что
    $
        (1 + x_1)(1 + x_2) ... (1 + x_n) >= 1 + x_1 + x_2 + ... + x_n,
    $
    где $x_i$ одного знака, и $x_i > -1$. Это похоже на неравенство Бернулли и доказывается точно также, по индукции. Это остается читателю в качестве упражнения.

    Наконец, $(1 - p_n)^(n - k) --> e^(-lambda)$, потому что
    $
         (n - k) ln(1 - p_n) --> (n - k) ln(1 - lambda/n) sim (n - k) (-lambda/n) --> -lambda.
    $
]

#th(name: "локальная теорема Маувра-Лапласа")[
    Пусть $0 < p < 1$ и $q := 1 - p$, при $n -> oo$,
    $
        x = (k - n p) / sqrt(n p q),
    $
    и $k$ меняется так, что $abs(x) <= T$.
    Тогда
    $
        P(S_n = k) sim 1/(sqrt(2 pi n p q)) e^(-x^2/2)
    $
    равномерно по $x$ в интервале $[-T, T]$ в схеме Бернулли с $n$ испытаниями и вероятностью успеха $p$.
]

#proof[
    $
        P(S_n = k) = C_n^k p^k q^(n - k) = n!/(k! (n - k)!) p^k q^(n - k).
    $
    и
    $
        k = n p + x sqrt(n p q) >= n p - T sqrt(n p q) --> +oo,\
        n - k = n q - x sqrt(n p q) >= n q - T sqrt(n p q) --> +oo.
    $
    Так есть стремление к бесконечности, можно писать формулу Стирлинга:
    $
        P(S_n = k) =
            n!/(k! (n - k)!) p^k q^(n - k)
        sim
            (n^n cancel(e^(-n)) sqrt(cancel(2 pi) n))
            /
            (
                k^k cancel(e^(-k)) sqrt(2pi k)
                (n - k)^(n - k) cancel(e^(-n + k)) sqrt(cancel(2pi) (n - k))
            )
            dot p^k q^(n - k) 
        newline(sim)
            (n^n p^k q^(n - k) sqrt(cancel(n)))
            /
            (
                k^k (n - k)^(n - k) sqrt(2pi n p) dot
                sqrt(cancel(n) q)
            ) 
        =
            1/sqrt(2 pi n p q) dot (n^n p^k q^(n - k))
            /
            (k^k (n - k)^(n - k)).
    $
    Надо показать, что последняя дробь стремиться к $e^(-x^2/2)$. Логарифмируем (и сразу домножаем на $-1$ чтобы получить стремление к $x^2/2$):
    $
        k ln k/n + (n - k) ln(1 - k/n) - k ln p - (n - k) ln q newline(=)
        k ln (k / (n p)) + (n - k) ln ((n - k) / (n q)).
    $
    Смотрим на дроби:
    #text(size: 0.96em, $
        k / (n p) = (n p + x sqrt(n p q)) / (n p) = 1 + x sqrt(q/(n p)) ==> ln(k/(n p)) = ln(1 + x sqrt(q/(n p))) = x sqrt(q/(n p)) - x^2 q/(2n p) + O(1/(n sqrt(n))).\
        (n - k)/(n q) = (n q - x sqrt(n p q)) / (n q) = 1 - x sqrt(p/(n q)) ==> ln((n - k)/(n q)) = ln(1 - x sqrt(p/(n q))) = -x sqrt(p/(n q)) - x^2 p/(2n q) + O(1/(n sqrt(n))).
    $)

    Подставляем в сумму:
    $
        k ln (k / (n p)) + (n - k) ln ((n - k) / (n q)) newline(=)
        text(size: #0.95em,
            (n p + x sqrt(n p q))(x sqrt(q/(n p)) - x^2 q/(2n p) + O(1/(n sqrt(n)))) + (n q - x sqrt(n p q))(-x sqrt(p/(n q)) - x^2 p/(2n q) + O(1/(n sqrt(n))))
        ) newline(=)
        text(size: #0.9em,
            x sqrt(n p q) + x^2 q - (x^2 q)/2 - x sqrt(n p q) + x^2 p - (x^2 p)/2 + O(1/sqrt(n)) = x^2 (p + q - p/2 - q/2) + O(1/sqrt(n)) = x^2/2 + O(1/sqrt(n))
        ).
    $
]

#notice[
    Аналогичное утверждение верно, если $abs(k - n p) <= phi(n)$, где $phi(n) = o((n p q)^(2/3))$ (в теореме $abs(k - n p) <= C sqrt(n p q)$).
]
