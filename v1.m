%first song
[y, Fs] = audioread('The Curtain 2.mp3');

%second song
[y2, Fs] = audioread('The Curtain 2.mp3');
%find shortest song, and set max of iterator to that.
L1 = length(y);
L2 = length(y2);
if L1 > L2
    maxnum = length(y2);
elseif L1 < L2
    maxnum = length(y);
else
    maxnum = 60.*44100;
end

%for comparing left and right audio channels
diffLeft = 0;
diffRight = 0;
for i = 1:(maxnum-1)
    %apply the formula given in the report.
    diffLeft = diffLeft + (abs(y(i,1)-y2(i,1)).^2);
    diffRight = diffRight + (abs(y(i,2)-y2(i,2)).^2);

end

%find the average between the audio channels.
diffLeft = (1/(maxnum)) .* diffLeft

diffRight = (1/(maxnum)) .* diffRight
%output the average.
diff = (diffLeft + diffRight)/2

%TODO: GUI, user selection, graphs, 