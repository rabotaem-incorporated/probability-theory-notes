#import "../../utils/core.typ": *

== Сходимость по распределению

#remind[
  $xi_1$, $xi_2$, ... --- сходится по распеределению к $xi$, если
  $
    lim F_(xi_n) (x) = F_xi (x)
  $
  во всех точках непрерывности $F_xi$.
]

#notice[
  Если $xi$ и $eta$ назависимы, $eta$ непрерывна, то $xi + eta$ --- непрерывная случайная величина.
]

#proof[
  $P(xi + eta = x) = P_(xi + eta) ({x}) = integral_RR underbrace(P_eta ({x - y}), =0) dif P_xi (y) = 0$.
]

#lemma[
  Если $F_n$ и $F$ --- функции распределения такие, что для любых $a, b in RR$,
  $
    lim (F_n (b) - F_n (a)) = F(b) - F(a)
  $
  то $lim F_n (x) = F(x)$ для любого $x in RR$.
]

#proof[
  Сущесвуют $a$ такая, что $F(a) < eps$. Тогда при больших $n$, $F_n (a) < 3 eps$.

  Возьмем $x in RR$:
  $
    abs(F_n (x) - F(x)) <= abs((F_n (x) - F_n (a)) - (F (x) - F (a))) + abs(F_n (a)) + abs(F(a)) newline(<) underbrace(abs((F_n (x) - F_n (a)) - (F(x) - F(a))), <eps) + 3 eps + eps.
  $
  Значит по определению есть предел.
]

#def[
  $B$ --- _регулярное множество_ для меры $P_xi$, если $P_xi (Cl B without Int B) = 0$.
]

#th[
  $xi$, $xi_1$, $xi_2$, ... --- случайные величины, $F$, $F_1$, $F_2$, ... --- их функции распределения. $phi$, $phi_1$, $phi_2$, ... --- характеристические функции.

  Следующие условия равносильны:
  1. $xi_n$ сходится к $xi$ по распределению.
  2. для любого $U subset RR$ открытого, $liminf P(xi_n in U) >= P(xi in U)$.
  3. для любого $A subset RR$ замкнутого, $limsup P(xi_n in A) <= P(xi in A)$.
  4. для любого $B subset RR$ регурярного борелевского, $lim P(xi_n in B) = P(xi in B)$.
  5. для любого $B subset RR$ регурярного борелевского, $lim E bb(1)_B (xi_n) = E bb(1)_B (xi)$.
  6. для любой $f in C(RR)$ непрерывной ограниченной $lim E f(xi_n) = E f(xi)$.
  7. $phi_n$ сходится к $phi$ поточечно.
]

#proof[
  "Ну тут 3 стрелки содержательные, остальные тривиальщина" --- Храбров.

  - "$2 <==> 3$": Пусть $A := RR without U$. Тогда $P(eta in A) = 1 - P(eta in U)$ и
    $
      limsup P(xi_n in A) = limsup (1 - P(xi_n in U)) = 1 - liminf P(xi_n in U).
    $
    В 2 и 3 мы знаем, что все выражения в этих равенствах не больше $P(xi in A) = 1 - P(xi in U)$. Понятно, что они следуют друг из друга.
  
  - "$2+3 ==> 4$": Пусть $U = Int B$, $A = Cl B$. Тогда $P(xi in B) = P(xi in U)$ так как
    $
      P(xi in B) - P(xi in U) = P(xi in B without U) = P_xi (B without U) <= P_xi (A without U) = 0.
    $
    Тогда
    $
      P(xi in B) = P(xi in U) <=
      liminf P(xi_n in U) <=
      liminf P(xi_n in B) <=
      limsup P(xi_n in B) newline(<=)
      limsup P(xi_n in A) <=
      P(xi in A) = P(xi in B).
    $
  
  - "$4<==>5$": $E bb(1)_B (eta) = P(bb(1)_B (eta) = 1) = P(eta in B)$, поэтому
    $
      lim P(xi_n in B) = lim E bb(1)_B (xi_n) = E bb(1)_B (xi) = P(xi in B).
    $

  - "$6 ==> 7$":
    $
      phi_n (t) =
      E e^(i t xi_n) =
      E (cos(t xi_n) + i sin (t xi_n)) =
      E cos(t xi_n) + i E sin(t xi_n) --> \
      E cos(t xi) + i E sin (t xi) =
      E (cos(t xi) + i sin (t xi)) =
      E e^(i t xi) =
      phi(t).
    $
  
  - "$1 ==> 2$": возьмем $U$ открытое. Рассмотрим $U = usb_(k=1)^oo (a_k, b_k]$. Разбить так множество можно: в начале возьмем ячейки $(k, k + 1]$, $k in ZZ$, и возьмем все, что влезли с замыканием. Потом поделим пополам все, что влезли частично, и возьмем их половики. Потом поделим еще раз, снова возьмем все что влезло с замыканием, и так далее. Едиснтвенное, мы потребуем еще одно условие: $P(xi = a_k) = P(xi = b_k) = 0$. К счастью, в любой окрестности любой границы отрезка найдется точка, где вероятность равна 0. Вот возьмем ее: то есть будем отклоняться от каждой границы на $1/4$ длины отрезка, из которого вы выбираем середину, чтобы всегда брать точки, где распределение непрерывно.
    Тогда
    $
      P(xi_n in U) = P(xi_n in usb_(k=1)^oo (a_k, b_k]) >= P(xi_n in usb_(k = 1)^m (a_k, b_k]) = sum_(k=1)^m P(xi_n in (a_k, b_k]) newline(=)
      sum_(k=1)^m (F_n (b_k) - F_n (a_k)) newline(==>)
      liminf P(xi_n in U) >= liminf sum_(k=1)^m (F_n (b_k) - F_n (a_k)) = sum_(k=1)^m (F(b_k) - F(a_k)) newline(=) P(xi in usb_(k = 1)^m (a_k, b_k]) -->_(m-->oo) P (xi in usb_(k=1)^oo (a_k, b_k]) = P (xi in U).
    $


  - "$5==>6$":
    Пусть 
    $
      D := {x: P(f(xi) = x) > 0} =
      {x: P(xi in f^(-1) (x)) > 0}.
    $
    Это не более чем счетное множество. Рассмотрим $M$ такое, что $abs(f) <= M$, $plus.minus M in.not D$. Разобьем $(-M, M]$ на ячейки $(t_(j - 1), t_j]$ с мелкостью дробления меньше $eps$ так, что $t_j in.not D$ для любого $j$. Рассмотрим $B_j := {x in RR: t_(j - 1) < f(x) <= t_j}$. Тогда
      $
        B_j supset U_j := {x in RR: t_(j - 1) < f(x) < t_j}
      $
      --- открытое. Более того, $B_j subset A_j := {x in RR : t_(j - 1) <= f(x) <= t_j}$ --- замкнутое. Более того, $Cl B_j without Int B_j subset A_j without U_j$. Тогда
      $
        P_xi (Cl B_j without Int B_j) <= P_xi (A_j without U_j) = P_xi (f^(-1) (t_(j - 1)) union f^(-1) (t_j)) = 0.
      $
      Значит $B_j$ регулярное. Тогда по пункту 5 $E bb(1)_(B_j) (xi_n) --> E bb(1)_B_j (xi)$.

      Рассмотрим $g(x) := sum_(j = 1)^m t_(j - 1) bb(1)_B_j (x)$. Тогда $E g(xi_n) --> E g(xi)$, так как это просто линейная комбинация индикаторов. А еще мы знаем $0 < f(x) - g(x) < eps$. Ну тогда $E abs(g(eta) - f(xi)) < eps$. Добиваем:
      $
        abs(E f(xi_n) - E f(xi)) =
        abs(E f(xi_n) - E g(xi_n) + E g(xi_n) - E g(xi) + E g(xi) - E f(xi))
        newline(<=)
          abs(E (f(xi_n) - g(xi_n))) +
          abs(E (g(xi_n) - g(xi))) +
          abs(E (g(xi) - f(xi))) 
        newline(<=)
          underbrace(E abs(f(xi_n) - g(xi_n)), < eps) +
          underbrace(abs(E g(xi_n) - g(xi)), --> 0\, "значит" < eps\ "при больших" n) +
          underbrace(E abs(g(xi) - f(xi)), <eps) < 3eps
      $
      при больших $n$.
      Значит
      $
        lim E f(xi_n) = E f(xi).
      $

  - "$7 ==> 1$":
    $
      P(xi_n in [a, b]) = lim_(T-->+oo) 1/(2pi) integral_(-T)^T (e^(-i a t) - e^(-i b t))/(i t) phi_n (t) dif t.
    $
    Возьмем случайную величину $eta_sigma sim Nn(0, sigma^2)$, независящую от $xi$, $xi_1$, $xi_2$, .... Положим 
    $
      psi_n (t) := phi_(xi_n + eta_sigma) (t) = phi_n (t) dot phi_(eta_sigma) (t) = phi_n (t) e^(-sigma^2 t^2/2) --> phi(t) e^(-sigma^2 t^2/2) = phi_(xi + eta_sigma) (t) =: psi(t).
    $
    Тогда
    $
      P(xi_n + eta_sigma in [a, b]) = 1/(2pi) integral_RR (e^(-i a t) - e^(-i b t))/(i t) phi_n (t) e^(-sigma^2 t^2/2) dif t.
    $
    Под интегралом все ограничено: дробь константой, $phi_n$ единицей, поэтому есть суммируемая мажоранта и можно переходить к пределу:
    $
      P(xi_n + eta_sigma in [a, b]) --> 1/(2pi) integral_RR (e^(-i a t) - e^(-i b t))/(i t) phi(t) e^(-sigma^2 t^2/2) dif t = P(xi + eta_sigma in [a, b]).
    $
    Все бы хорошо, только мы чтобы избавиться от интеграла по главному значению, поменяли нашу случайную величину. Давайте объяснять, что это сильно ничего не испортило:
    $
      G_(n sigma) (x) := F_(xi_n + eta_sigma) (x), space G_sigma (x) := F_(xi + eta_sigma) (x).
    $
    Тогда
    $
      G_(n sigma) (b) - G_(n sigma) (a) --> G_sigma (b) - G_sigma (a) space (forall a, b in RR) ==> G_(n sigma) --> G_sigma "поточечно".
    $
    Возьмем $delta > 0$, тогда
    $
      {xi_n + eta_sigma <= x - delta} without {abs(eta_sigma) > delta} subset {xi_n <= x} subset {xi_n + eta_sigma <= x + delta} union {abs(eta_sigma) >= delta}.
    $
    Можно написать неравенства на вероятности:
    $
      P(xi_n + eta_sigma <= x - delta) - P(abs(eta_sigma) >= delta) <= P(xi_n <= x) <= P(xi_n + eta_sigma <= x + delta) + P(abs(eta_sigma) >= delta).
    $
    Распишем через функции распределения где можем:
    $
      G_(n sigma) (x - delta) - P(abs(eta_sigma) >= delta) <= F_n (x) <= G_(n sigma) (x + delta) + P(abs(eta_sigma) >= delta).
    $
    Оцениваем вероятность:
    $
      P(abs(eta_sigma) >= delta) <=^"Чебышев" (D eta_sigma)/delta^2 = sigma^2/delta^2.
    $
    Тогда
    $
      G_(n sigma) (x - delta) - sigma^2/delta^2 <=^(A(x)) F_n (x) <=^(B(x)) G_(n sigma) (x + delta) + sigma^2/delta^2.
    $
    Да, я только что обозначил неравенста за $A(x)$ и $B(x)$.

    Переходим к пределу:
    $
      F(x - 2delta) - 2sigma^2/delta^2 <=^(B(x-2 delta))
      G_sigma (x - delta) - sigma^2/delta^2 =
      liminf (G_(n sigma) (x - delta) - sigma^2/delta^2) <=^(A(x))
      liminf F_n (x) newline(<=)
      limsup F_n (x) <=^(B(x))
      limsup (G_(n sigma) (x + delta) + sigma^2/delta^2) =
      G_sigma (x + delta) + sigma^2/delta^2 <=^(A(x + 2delta)) F(x + 2 delta) + 2 sigma^2/delta^2.
    $
    Устремляем $sigma$ к нулю, а потом устремляем $delta$ к нулю в точках непрерывности $F$, Получаем
    $
    F(x) <= liminf F_n (x) <= limsup F_n (x) <= F(x)
    $
  
  *mic drop.*
]

#th[
  $F_n$, $F$: $RR --> [0, 1]$ --- функции распределения, $F in C(RR)$ и $F_n$ поточечно сходится к $F$. Тогда $F_n arrows F$.
]

#proof[
  Пусть $m in NN$, и $t_k$ такие, что $F(t_k) = k/m$ для $k = 1, 2, ..., m - 1$. Пусть $t_0 = -oo$, $t_m = +oo$. Такие точки найдутся из-за непрерывности. Возьмем $eps >= 0$ и $N$ такое, что для любого $k$, $forall n >= N space abs(F_n (t_k) - F(t_k)) < eps$. Рассмотрим $t in RR$ и возьмем $t_k <= t < t_(k + 1)$. Оцениваем:
  $
    F_n (t) &<= F_n (t_(k + 1)) < F (t_(k + 1)) + eps = (k + 1)/m + eps = k/m + 1/m + eps = F(t_k) + 1/m + eps <= F(t) + 1/m + eps, \
    F_n (t) &>= F_n (t_k) > F (t_k) - eps = k/m - eps = (k + 1)/m - 1/m - eps = F(t_(k + 1)) - 1/m - eps >= F(t) - 1/m - eps.
  $
  Тогда $F(t) - 1/m - eps < F_n (t) < F(t) + 1/m + eps$. Значит начиная с какого-то номера для любого $t$ разность $F$ и $F_n$ небольшая. Это и есть равномерная сходимость.
]

