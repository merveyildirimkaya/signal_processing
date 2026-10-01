function y = firfilt(b, x)

    Lx = length(x);
    Lb = length(b);

    y = zeros(1, Lx + Lb - 1);

    for n = 1:length(y)

        for k = 1:Lb

            index = n - k + 1;

            if index >= 1 && index <= Lx
                y(n) = y(n) + b(k) * x(index);
            end

        end

    end
end