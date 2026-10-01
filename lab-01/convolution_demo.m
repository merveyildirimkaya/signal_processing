function convolution_demo

clc;
close all;

% Signals
x = [1 1 1 1 1];
h = [1/3 1/3 1/3];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

y = zeros(1,Ly);

current_n = 0;

% Figure
fig = uifigure('Name','Convolution Demo', ...
               'Position',[100 50 850 800]);

% Axes
ax1 = uiaxes(fig,'Position',[70 610 700 140]);
ax2 = uiaxes(fig,'Position',[70 440 700 140]);
ax3 = uiaxes(fig,'Position',[70 270 700 140]);
ax4 = uiaxes(fig,'Position',[70 100 700 140]);

% Back button
uibutton(fig,'push', ...
    'Text','Back Step', ...
    'Position',[270 30 120 35], ...
    'ButtonPushedFcn',@backStep);

% Next button
uibutton(fig,'push', ...
    'Text','Next Step', ...
    'Position',[440 30 120 35], ...
    'ButtonPushedFcn',@nextStep);

updatePlots();


    function nextStep(~,~)

        if current_n < Ly-1
            current_n = current_n + 1;
            updatePlots();
        end

    end


    function backStep(~,~)

        if current_n > 0
            current_n = current_n - 1;
            updatePlots();
        end

    end


    function updatePlots()

        n = current_n;

        y(:) = 0;

        % Calculate convolution values up to current step
        for nn = 0:n

            for k = 0:Lh-1

                index = nn-k;

                if index >= 0 && index < Lx
                    y(nn+1) = y(nn+1) + ...
                              h(k+1)*x(index+1);
                end

            end

        end


        % Positions of h[n-k]
        k_shifted = n - (0:Lh-1);


        % ---------------- h[k] ----------------
        stem(ax1,0:Lh-1,h,'filled')

        ax1.XLim = [-4 Ly];
        ax1.YLim = [0 0.5];

        grid(ax1,'on')
        title(ax1,'Impulse Response h[k]')
        xlabel(ax1,'k')
        ylabel(ax1,'h[k]')


        % ---------------- x[k] ----------------
        stem(ax2,0:Lx-1,x,'filled')

        ax2.XLim = [-4 Ly];
        ax2.YLim = [0 1.2];

        grid(ax2,'on')
        title(ax2,'Input Signal x[k]')
        xlabel(ax2,'k')
        ylabel(ax2,'x[k]')


        % ---------------- h[n-k] ----------------
        stem(ax3,k_shifted,h,'filled')

        ax3.XLim = [-4 Ly];
        ax3.YLim = [0 0.5];

        grid(ax3,'on')
        title(ax3,['h[n-k],   n = ' num2str(n)])
        xlabel(ax3,'k')
        ylabel(ax3,'h[n-k]')


        % ---------------- y[n] ----------------
        stem(ax4,0:n,y(1:n+1),'filled')

        ax4.XLim = [-4 Ly];
        ax4.YLim = [0 1.2];

        grid(ax4,'on')
        title(ax4,['Output y[n],   y[' num2str(n) '] = ' ...
                   num2str(y(n+1),'%.3f')])

        xlabel(ax4,'n')
        ylabel(ax4,'y[n]')

    end

end