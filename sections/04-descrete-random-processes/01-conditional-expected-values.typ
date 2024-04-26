#import "../../utils/core.typ": *

== Условные математические ожидания

#def[
  Пусть $(Omega, Ff, P)$ --- вероятностное пространство, $A in Ff$ --- случайное событие, $xi$ --- случайная величина. _Условным математическим ожиданием случайной величины $xi$ при условии $A$_ называется
  $
    E(xi | A) := E(xi bb(1)_A)/P(A).
  $
]

#notice[
  Если событие $A$ и ${xi <= c}$ независимы для любого $c in RR$ (то есть $bb(1)_A$ и $xi$ независимы), то
  $
    E(xi | A) = E(xi bb(1)_A)/P(A) = (E(xi) E bb(1)_A)/P(A) = E(xi).
  $
]

#props[
  1. $xi >= eta ==> E (xi | A) >= E(eta | A)$.
  2. Линейность.
  3. $abs(E(xi | A)) <= E (abs(xi) | A)$.
]

#def[
  Пусть $Omega = usb A_n$ --- разбиение $amogus$, $P(A_n) > 0$. _Условным матожиданием относительно разбиения_ называется
  $
    E(xi | amogus) := sum E(xi | A_n) bb(1)_(A_n) = sum E(xi bb(1)_(A_n))/P(A_n) bb(1)_(A_n).
  $
  Это случайная величина, уже не число.
]

#prop[
  $E(E(xi | amogus)) = E xi$.
]

#proof[
  $
    E(E(xi | amogus)) =
    E(sum (E(xi bb(1)_(A_n)))/(P(A_n)) bb(1)_(A_n)) =
    sum E ((E (xi bb(1)_(A_n)))/P(A_n) bb(1)_(A_n)) newline(=)
    sum E(xi bb(1)_(A_n))/P(A_n) E bb(1)_(A_n) =
    E sum(xi bb(1)_(A_n)) =
    E xi.
  $
]

#def[
   Пусть $eta$ --- дискретная случайная величина со значениями $y_1, y_2, ..., y_n$. $P(eta = y_k) > 0$. Тогда есть разбиение $Omega = usb {eta = y_k}$.
   $ E(xi | eta) := E(xi | "разбиение выше") = sum E(xi | eta = y_k) bb(1)_{eta = y_k}. $
]

#props[
  1. $E(E(xi | eta)) = E xi$.
  2. $E(xi | xi) = xi$.
]

#example[
  Пусть $xi = Geom(p)$, $eta$ --- результат первого подбрасывания. Тогда
  $
    E(xi | eta) = underbrace(E(xi | eta = 0), 1 + E xi) bb(1)_{eta = 0} + underbrace(E(xi | eta = 1), 1) bb(1)_{eta = 1}.
  $
  Отсюда
  $
    E(E(xi | eta)) = (1 + E xi) (1 - p) + 1 dot p = (1 - p) E xi + 1 ==> E xi = 1/p.
  $
]

#exercise[
  Пусть $xi_n$ --- количество испытаний в схеме Бернулли до достижения $n$ последовательных успехов. Найти $E xi_n$. Указание: найти $E(xi_n | xi_(n - 1))$.
]

#example[
  $N$, $xi_1$, $xi_2$, ... независимые случайные величины, $N$ --- имеет натуральное значение, а $xi_k$ одинаково распределены, и $a := E xi_k$. Найдем $E S$, где $S := xi_1 + xi_2 + ... + xi_N$.

  Знаем
  $
    E_S = E(E(S|N)).
  $
  Поэтому достаточно найти $E (S | N)$:
  $
    E(S|N) =& sum_(n = 1)^oo E(S | N = n) dot bb(1)_{N=n},\
    E(S|N = n) =&
    E(S bb(1)_{N=n})/P(N=n) =
    E((xi_1 + xi_2 + ... + xi_n) bb(1)_{N = n})/P(N=n) newline(=^"независимость")&
    (E(xi_1 + xi_2 + ... + xi_n) cancel(E bb(1)_{N=n}))/(cancel(P(N = n))) =
    E(xi_1 + ... + xi_n) =
    n a.
  $
  Значит
  $
    E(S|N) = E sum(n a bb(1)_{N=n}) = a underbrace(sum_(n=1)^oo n E bb(1)_{N=n}, E N) = a E N.
  $
]

#exercise[
  Найти $D S$, если известны $E xi$, $D xi$, $E N$, $D N$.
]

#example[
  $N$, $xi_1$, $xi_2$, ... --- независимые случайные величины с неотрицательными целыми значениями. $xi_1$, $xi_2$, ... --- одинаково распределены, и $F$ --- их производящая функция. $G$ --- производящая функция для $N$. Найти производящую функцию $G_S$ для $S := xi_1 + xi_2 + ... + xi_N$.

  Напомню, производящая функция для дискретной случайной величины $xi$ --- это
  $
    G_xi = sum_(k = 0)^oo P(xi = k) t^k = E t^xi.
  $

  Тогда надо найти $E t^S$:
  $
    E t^S = E(E(t^S | N)).
  $
  Считаем:
  $
    E(t^S | N) = sum_(n = 0)^oo E(t^S | N = n) bb(1)_{N = n}.
  $
  И еще раз считаем:
  $
    E(t^S | N = n) =
    (E(t^S bb(1)_{N = n}))/P(N = n) =
    (E(t^(xi_1 + xi_2 + ... + xi_n)) bb(1)_{N = n})/P(N = n) newline(=)
    (E t^(xi_1) ... E t^(xi_n) cancel(E bb(1)_{N = n}))/cancel(P(N = n)) = (E t^(xi_1))^n = (F(t))^n.
  $
  Подставляем:
  $
    G_S (t) =
    E t^S =
    E(E(t^S | N)) =
    E (sum_(n = 0)^oo (F(t))^n bb(1)_{N = n}) newline(=)
    sum_(n = 0)^oo (F(t))^n E bb(1)_{N = n} =
    sum_(n = 0)^oo (F(t))^n P(N = n) =
    G(F(t)).
  $
]
