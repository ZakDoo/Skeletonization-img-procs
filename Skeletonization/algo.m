function outImg = zhangSuenThinning(binaryImage)
    % Ensure binary image
    img = logical(binaryImage);
    changing = true;

    while changing
        changing = false;
        toDelete = false(size(img));

        % Step 1
        for i = 2:size(img, 1)-1
            for j = 2:size(img, 2)-1
                P = getNeighbors(img, i, j);
                if img(i,j) == 1 && ...
                        sum(P) >= 2 && sum(P) <= 6 && ...
                        transitions(P) == 1 && ...
                        P(1) * P(3) * P(5) == 0 && ...
                        P(3) * P(5) * P(7) == 0
                    toDelete(i,j) = true;
                end
            end
        end
        img(toDelete) = 0;

        % Step 2
        toDelete = false(size(img));
        for i = 2:size(img, 1)-1
            for j = 2:size(img, 2)-1
                P = getNeighbors(img, i, j);
                if img(i,j) == 1 && ...
                        sum(P) >= 2 && sum(P) <= 6 && ...
                        transitions(P) == 1 && ...
                        P(1) * P(3) * P(7) == 0 && ...
                        P(1) * P(5) * P(7) == 0
                    toDelete(i,j) = true;
                end
            end
        end
        if any(toDelete(:))
            changing = true;
            img(toDelete) = 0;
        end
    end
    outImg = img;
end

% Helper: extract 8 neighbors in clockwise order
function P = getNeighbors(img, x, y)
    P = [img(x-1,y), img(x-1,y+1), img(x,y+1), img(x+1,y+1), ...
         img(x+1,y), img(x+1,y-1), img(x,y-1), img(x-1,y-1)];
end

% Helper: count 0→1 transitions in neighbors
function count = transitions(P)
    P = [P, P(1)]; % wrap around
    count = sum((P(1:end-1) == 0) & (P(2:end) == 1));
end


I = imread('germs.png');
BW = imbinarize(rgb2gray(I));
BW = bwareaopen(BW, 30); % remove small noise

skeleton = zhangSuenThinning(BW);

figure;
subplot(1,2,1); imshow(BW); title('Original');
subplot(1,2,2); imshow(skeleton); title('Zhang-Suen Skeleton');
