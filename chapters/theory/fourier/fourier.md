# Разложение функций в ряды

## Мотивировка
Многие из вас уже знают про существование степенного ряда Тейлора. Однако, функции можно представлять не только полиномом, но и суммой периодических функций: синуса и косинуса. В данном пособии будет разобрано последнее из упомянутых выше разложений.

## Ряд Фурье
Пускай нам дана функция $f(x)$, с периодом $2 \pi$. Такое утверждение эквивалентно следующему: $f(x) = f(x + 2 \pi)$. 

---
### Утверждение
Пусть нам дана нам дана функция $f(x)$, которая определена на промежутке $[-\pi,\pi]$. Если данная функция интегрируема на отрезке $[-\pi,\pi]$, то ее можно разложить в тригонометрический ряд Фурье.
$$f(x) \sim \frac{a_0}{2} +  \sum_{n=1}^{\infty} ({a_n \cos{nx} + b_n \sin{nx}})$$ где $a_0, a_n, b_n$ - коэффициенты Фурье, задающиеся следующим образом:
$$a_o = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x)dx}$$
$$a_n = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x) \cos{nx} dx}$$
$$b_n = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x) \sin{nx} dx}$$

---
## Вывод коэффициентов

--- 
### Математическая справка:
* Основы тригонометрии:
  1. $\sin{n\pi} = 0$
  2. $\cos{n\pi} = (-1)^{n}$
* Условия ортогональности:
  1. Интеграл $\cos{nx}$ и $\sin{nx}$ по периоду равен 0:
    $$\int_{-\pi}^{\pi} {\cos{nx} dx} = \left. \frac{1}{n} \sin{nx} \right|_{-\pi}^{\pi} = 0$$
    $$\int_{-\pi}^{\pi} {\sin{nx} dx} = \left. -\frac{1}{n} \cos{nx} \right|_{-\pi}^{\pi} = 0$$
  <!-- 2. Интеграл $\cos^2{nx}$ и $\sin^2{nx}$ по периоду равен:
    $$\int_{-\pi}^{\pi}{\cos^2{nx} dx} = \left.\left(\frac{\sin{nx} \cos{nx}}{2} + \frac{x}{2}\right)\right|_{-\pi}^{\pi} = \pi$$
    $$\int_{-\pi}^{\pi}{\sin^2{nx} dx}$$ -->
  2. Интеграл $\sin{nx}\cos{mx}$ по периоду равен 0:
    $$\int_{-\pi}^{\pi}{\sin{nx}\cos{mx}}dx = \frac{1}{2} \int_{-\pi}^{\pi}(\sin(m-n)x + \sin(m+n)x)dx = 0$$
    $$\sin{A}\cos{B} = \frac{1}{2}[\sin(A-B) + \sin(A+B)]$$
  3. Интеграл $\sin{mx} \sin{nx}$ по периоду:
    $$\int_{-\pi}^{\pi}{\sin{mx} \sin{nx}}dx = \frac{1}{2} \int_{-\pi}^{\pi}(\cos(m-n)x - \cos(m+n)x)dx = \begin{cases} \pi &{\text{если } m = n \neq 0} \\ 0 &\text{иначе}\end{cases}$$
    $$\sin{A}\sin{B} = \frac{1}{2}[\cos(A-B) - \cos(A+B)]$$
  4. Интеграл  $\cos{mx} \cos{nx}$ по периоду:
    $$\int_{-\pi}^{\pi}{\cos{mx} \cos{nx}}dx = \frac{1}{2} \int_{-\pi}^{\pi}(\cos(m-n)x + \cos(m+n)x)dx = \begin{cases} 2\pi &{\text{если } m = n = 0} \\ \pi &{\text{если } m = n \neq 0} \\0 &\text{иначе}\end{cases}$$
    $$\cos{A}\cos{B} = \frac{1}{2}[\cos(A-B) + \cos(A+B)]$$



### Получение коэффициентов
По определению ряда Фурье
$$(*) f(x) = \frac{1}{2} a_0 + a_1\cos x + b_1\sin x **+ \dotsb + a_n \cos nx + b_n \sin x + \dotsb$$
То домножив правую и левую части равенства $(*)$ на $\cos{nx}$ и интегрируя от $-\pi$ до $\pi$, получим
$$\Chi_n = \int_{-\pi}^{\pi}{f(x) \cos{nx} dx} = \frac{1}{2} a_0 \int_{-\pi}^{\pi}{\cos{nx}dx} + a_1 \int_{-\pi}^{\pi}{\cos x \cos{nx} dx} + \dotsb$$
Заметим, что для $n = 0$
$$\Chi_0 = \frac{1}{2} a_0 \int_{-\pi}^{\pi}{\cos^2{nx}dx} = \pi a_0 \Rightarrow a_o = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x)dx}$$
Для $n \neq 0$
$$\Chi_n = a_n \int_{-\pi}^{\pi}{\cos^2{nx}dx} = \pi a_n \Rightarrow a_n = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x) \cos{nx} dx}$$
Если же $(*)$ домножить на $\sin{nx}$, то получим
$$\gamma_n = \int_{-\pi}^{\pi}{f(x) \sin{nx} dx} = \frac{1}{2} a_0 \int_{-\pi}^{\pi}{\sin{nx}dx} + a_1 \int_{-\pi}^{\pi}{\cos x \sin{nx} dx} + \dotsb$$
Тогда
$$\gamma_n = b_n\int_{-\pi}^{\pi}{\sin^2{nx} dx} = \pi b_n \Rightarrow b_n = \frac{1}{\pi} \int_{-\pi}^{\pi}{f(x) \sin{nx} dx}$$

---
## Теорема о сходимости ряда Фурье
Если $f(x)$ - переодическая функция с периодом, равным $2\pi$ и $f(x), f'(x)$ кусочно-непрерывны на отрезке $[-\pi, \pi]$, то ряд Фурье сходится.
Сумма бесконечного ряда Фурье ($\Sigma$) стремится к $f(x)$ во всех $x$, где $f(x)$ непрерывна.
В точках, где $f(x)$ испытывает разрыв, $\Sigma$ равна среднему значению, а то есть $\Sigma = \frac{f(x^+) + f(x^-)}{2}$ 

---
### Четные и нечетные функции
Всем известно, что косинус - четная, а синус - нечетная функция. Тогда можно понять, что для разложения четных $f(x)$ нам не нужен нечетный синус и наоборот, для нечетных $g(x)$ коэффициенты перед косинусом обнулятся.
Таким образом мы можем получить следующее разложение ряда Фурье:
$$f(x) = a_0 + a_1 \cos x + \dotsb + a_n \cos nx + \dotsb$$
$$g(x) = b_1 \sin x + b_2 \sin 2x + \dotsb + b_n \sin nx + \dotsb$$

Также мы можем заметить, что если функция определена на каком-то интервале (условно $[-\pi, \pi]$), то мы можем разложить ее только на области определеня, а ее "экстраполяцию" отбросить какими-то условиями (сделать ряд кусочно-заданным).
Функции, определенные на "полуинтервале" (для примера $[0, \pi]$) мы можем дополнять до четных функций, а затем отбрасывать ненужные значения.

## Расширение множества функций
Для того, чтобы расширить множество функций, которые мы можем задать с помощью похожего разложения, давайте введем следующие понятия:
* $T$ - период разложения
* $p \equiv \frac{T}{2}$ - полупериод разложения

Тогда, преобразовав коэффициенты Фурье таким образом:
$$a_o = \frac{1}{p} \int_{-p}^{p}{f(x)dx}$$
$$a_n = \frac{1}{p} \int_{-p}^{p}{f(x) \cos{\frac{\pi n x}{p}} dx}$$
$$b_n = \frac{1}{p} \int_{-p}^{p}{f(x) \sin{\frac{\pi n x}{p}} dx}$$

---
Можно получить коэффициенты такого вида с помощью следующих формул:
   $$\int_{-p}^{p} {\cos{\frac{\pi n x}{p}} dx} =  \left.\frac{p}{\pi n} \sin{\frac{\pi n x}{p}} \right|_{-p}^{p} = 0$$
   $$\int_{-p}^{p} {\sin{\frac{\pi n x}{p}} dx} =  \left.-\frac{p}{\pi n} \cos{\frac{\pi n x}{p}} \right|_{-p}^{p} = 0$$
   $$\int_{-p}^{p}{dx} = 2p$$
Проведя аналогию с тем, как мы выводили коэффициенты в предыдущих пунктах, получаем новые "расширенные" коэфициенты.

---
## Пример использования
**Разложить функцию $y=|x|(1 - |x|)$ в ряд Фурье на отрезке $(-1, 1]$**
Заметим, что функция четная по определению. Следовательно $b_n = 0$
$$a_0 = \int_{-1}^{1}|x|(1-|x|)dx = \int_{-1}^{1}|x|dx - \int_{-1}^{1}x^2dx = 1 - \frac{2}{3} = \frac{1}{3}$$
$$(0)a_n = \int_{-1}^{1}|x|(1-|x|)\cos(\pi n x)dx=\int_{-1}^{0}-x\cos(\pi n x)dx + \int_{0}^{1}x\cos(\pi n x)dx - \int_{-1}^{1}{x^2\cos(\pi n x) dx}$$
$$(1)\int x\cos(\pi n x)dx = \frac{x\sin(\pi n x)}{\pi n} - \frac{1}{\pi n} \int \sin(\pi n x)dx = \frac{x\sin(\pi n x)}{\pi n} - \frac{\cos(\pi n x)}{\pi^2n^2}$$
$$(2)\int_{-1}^{1}{x^2\cos(\pi n x) dx} = \frac{x^2\sin(\pi n x)}{\pi n}-\frac{2}{\pi n}\int x\sin(\pi n x) dx = \frac{x^2\sin(\pi n x)}{\pi n} + \frac{2x\cos(\pi n x)}{\pi^2 n^2} - \frac{2\sin(\pi n x)}{\pi^3 n^3}$$
Подставляя $(1), (2)$ в $(0)$, получаем:
$$a_n = -2\frac{1+\cos(\pi n)}{\pi^2 n^2}$$
Тогда ряд имеет вид:
$$f(x) = \frac{1}{6} - \frac{2}{\pi^2} \sum_{n=1}^{\infty}{\left(\frac{1+\cos(\pi n)}{n^2} \right) \cos(\pi n x)}$$
Построим график полученных функций, заметим, что все получилось - ряд сходится к изначальной функции.
![alt text](output.png)
## Интеграл Фурье
После того, как мы научились раскладывать в ряд функци, с любыми конечными периодами, совершив предельный переход и устремив период к бесконечности, мы можем получить обобщение ряда для любой функции.

---
### Утверждение 
Пусть $f(x)$ задана и абсолютно интегрируема ($\int_{\Re} |f(x)|dx < \infty$) на $\Re$. Тогда для нее можно определить интеграл Фурье:
$$f(x) = \frac{1}{\pi}\int_{0}^{\infty}\left[A(\alpha)\cos{\alpha x} + B(\alpha) \sin{\alpha x} \right] d{\alpha}$$
$$A(\alpha) = \int_{-\infty}^{\infty}{f(t)\cos{\alpha t}dt}$$
$$B(\alpha) = \int_{-\infty}^{\infty}{f(t)\sin{\alpha t}dt}$$
Или
$$f(x)= \frac{1}{\pi} \int_{0}^{\infty}\int_{-\infty}^{\infty}{f(x) \cos(\alpha (t - x))dt}d{\alpha}$$

---
## Вывод интеграла Фурье
Мы уже знаем, что
$$f(x) = \frac{1}{2p} \int_{-p}^{p}{f(t)dt}+\frac{1}{p} \sum_{n=1}^{\infty}\left[\left(\int_{-\infty}^{\infty}{f(t)\cos{\frac{\pi n t}{p}} dt} \right) \cos{\frac{\pi n}{p}}+ \left(\int_{-\infty}^{\infty}{f(t)\sin{\frac{\pi n t}{p}} dt} \right) \sin{\frac{\pi n}{p}}\right]$$
Если обозначить $\alpha_n = \frac{\pi n}{p}, \Delta \alpha = \alpha_n - \alpha_{n-1} = \frac{\pi}{p}$, то получим:
$$f(x) = \frac{1}{\pi} \left(\int_{-p}^{p}{f(t)dt}\right)\Delta\alpha+\frac{1}{\pi} \sum_{n=1}^{\infty}\left[\left(\int_{-\infty}^{\infty}{f(t)\cos{\alpha_n t} dt} \right) \cos{\alpha_n}+ \left(\int_{-\infty}^{\infty}{f(t)\sin{\alpha_n t} dt} \right) \sin{\alpha_n}\right]\Delta\alpha$$
Если $p \rightarrow \infty \Leftrightarrow \Delta\alpha \rightarrow 0$, то по определению:
$$\lim_{\Delta\alpha \rightarrow 0} \sum_{n=0}^{\infty}F(\alpha_n)\Delta\alpha \equiv \int_{0}^{\infty}{F(\alpha)d{\alpha}}$$
Мы получаем
$$f(x) = \frac{1}{\pi} \int_{0}^{\infty}\left[\left(\int_{-\infty}^{\infty}{f(t)\cos{\alpha t} dt} \right) \cos{\alpha x} + \left(\int_{-\infty}^{\infty}{f(t)\sin{\alpha t} dt} \right) \sin{\alpha x} \right]d{\alpha}$$
Мы получили определение. Можно упростить результат:
$$f(x) = \frac{1}{\pi}{\int_{0}^{\infty}{\left[\int_{-\infty}^{\infty} \left(\cos{\alpha t} \cos{\alpha x} + \sin{\alpha t} \sin{\alpha x} \right) dt \right] d{\alpha}}} = \frac{1}{\pi} \int_{0}^{\infty}\int_{-\infty}^{\infty}{f(x) \cos(\alpha (t - x))dt}d{\alpha}$$

---
## Теорема о сходимости интеграла Фурье
Если $f(x), f'(x)$ кусочно непрерывны на $\Re$ и $f(x)$ абсолютно интегрируема на R, то в точках, где $f(x)$ - непрерывна, интеграл Фурье сходится к $f(x)$. В точках разрыва $f(x)$ интеграл Фурье сходится к $\frac{f(x^+) + f(x^-)}{2}$

---
## Пример использования
**Представьте интегралом Фурье следующую функцию**
$$y = \begin{cases} a &{|x| < 1} \\ 0 &{|x| \geq 1}\end{cases}$$
$$(0)y = \frac{1}{\pi} \int_{0}^{\infty}\int_{-\infty}^{\infty}{f(x) \cos(\theta (t - x))dt}d{\theta}$$
$$(1) \int_{-\infty}^{\infty}{f(x) \cos(\theta (t - x))dt} = 0 + \int_{-1}^{1}a\cos(\theta (t - x))dt=\left.\frac{a}{\theta}\sin(\theta(t-x))\right|_{-1}^{1}$$
Подставив пределы, получаем
$$\frac{a}{\theta}\left( \sin(\theta(1-x) - \sin(\theta(-1-x)\right) = \frac{2a}{\theta}\sin\theta\cos{\theta x}$$
$$\sin A - \sin B = 2\sin{\frac{A - B}{2}}\cos\frac{A + B}{2}$$
Подставим $(1)$ в $(0)$
$$f(x) = \frac{2a}{\pi}\int_{0}^{\infty}{\frac{\sin\theta\cos\theta x}{\theta}} d{\theta}$$
Я не умею такое считать, так что оствлю как есть. Построим график нашей функции и приближенного интеграла Фурье, чтобы убедиться, что во время вычислений не допущено ошибок.
![alt text](output2.png)
Все сходится!
