%Вариант 16
X = [7 10 14 17 18 23 29 33];
Y = [-2 -4 -7 -11 -13 -16 -18 -21];
N = 8;
plot(X, Y, 'b--');

%Блок переменных
sum_x = 0; %сумма x
sum_x_sqr = 0; %сумма x^2
sum_x_cube = 0; %сумма x^3
sum_x_4 = 0; %сумма х^4
sum_xy = 0; %сумма х * у
sum_x2y = 0; %сумма х^2 * y 
sum_y = 0; %сумма y
mid_x = 0; %x среднее
mid_y = 0; %y среднее
top_a = 0; %числитель коэффициента а
bottom_a = 0; %знаменатель коэффициента а

%Блок вычислений
for i = 1:N
    sum_x = sum_x + X(i);
    sum_x_sqr = sum_x_sqr + X(i) .^ 2;
    sum_x_cube = sum_x_cube + X(i) .^ 3;
    sum_x_4 = sum_x_4 + X(i) .^ 4;
    sum_x2y = sum_x2y + (X(i)).^2 .* Y(i);
    sum_xy = sum_xy + X(i) .* Y(i);
    mid_x = sum_x ./ N;
    sum_y = sum_y + Y(i);
    mid_y = sum_y ./ N;
end

for i = 1:N
   top_a = top_a + ((X(i) - mid_x) .* (Y(i) - mid_y));
   bottom_a = bottom_a + (X(i) - mid_x).^2;
end

a = top_a ./ bottom_a;
b = mid_y - a .* mid_x;


%Построение МНК для линейной функции
f = Y;
for i = 1:N
    f(i) = a .* X(i) + b;
end
hold on;
plot(X, f);
hold off;


%МНК для квадратической функции
%https://excel2.ru/articles/mnk-kvadratichnaya-zavisimost-v-ms-excel#:~:text=%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%BE%D0%B2%20(%D0%9C%D0%9D%D0%9A)%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B0%D0%BD,%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%BE%D0%B2%20(%D0%B0%D0%BD%D0%B3%D0%BB.
matr = [N sum_x sum_x_sqr;
        sum_x sum_x_sqr sum_x_cube;
        sum_x_sqr sum_x_cube sum_x_4;];

%Решение системы через обратную матрицу
invMatr = inv(matr);
sums = [sum_y; sum_xy; sum_x2y];


%Элементы матрицы  = коэффициенты a b c
A = invMatr * sums;
c_1 = A(1);
b_1 = A(2);
a_1 = A(3);

%Построение МНК для квадратической функции
F(8) = 1;
for i = 1:N
    F(i) = a_1 .* (X(i))^2 + b_1 .* X(i) + c_1;
end


hold on;
plot(X, F);
grid on;
title('МНК');
legend('Первоначальная функция', '-0.74х + 2.4679', '-0.0137x^2 -1.2901x + 7.0164') 
hold off;

