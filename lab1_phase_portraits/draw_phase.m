function [] = draw_phase()
    global A x0
    T=6;
    [w, J] = eig(A);
    figure; hold on; grid on;
    a = 0 : pi/20 : 2*pi; X1 = [cos(a); sin(a)];
    X2 = X1 ./ [max(abs(X1)); max(abs(X1))]; M = size(X2, 2);
    
    for i = 1:M
        x0 = X2(:, i);
        puste = sim('model.slx', T);
        x = puste.x.signals.values;
        % Strzałki na portrecie fazowym
        quiver(x(:,1), x(:,2), gradient(x(:, 1)), gradient(x(:, 2)), "k");
        % Portret fazowy
        plot(x(:, 1), x(:,2), 'k-');
        % Wektory własne - strzałki
        quiver(0, 0, w(1, 1), w(2,1), 'r', "LineWidth", 3);
        quiver(0, 0, w(1, 2), w(2,2), 'r', "LineWidth", 3);
        % Zbiory równowagi - policzone według równania Ax = [0; 0] 
        plot(0, 0, "go", "MarkerSize", 7, "MarkerFaceColor", "g")

        title(['lambda(A) = [', num2str(J(1,1)), ',', num2str(J(2,2)), ']']);
        xlabel('x1'); ylabel('x2');
    end
end