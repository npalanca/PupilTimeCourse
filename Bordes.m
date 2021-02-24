
%threshold= input('Enter color threshold:  ');
PUPRIGHT=[]; 
strikes=0;
coordinate=0;

%Searching for right edge

while strikes<maxstrikes
    EVALUATION=imagen(POINT(1,2), (POINT(1,1)+ coordinate));  
    EVPOINT=[POINT(1,2), (POINT(1,1)+ coordinate)];
    PUPRIGHT=[PUPRIGHT;EVPOINT]; 
    if EVALUATION>thresholdH
        strikes=strikes+1;
        coordinate=coordinate+1; 
    else
        strikes=0;
        coordinate=coordinate+1;
    end
end

Redge=PUPRIGHT(1:(length(PUPRIGHT)-maxstrikes),:);


%Searching for left edge
PUPLEFT=[]; 
strikes=0;
coordinate=0;
while strikes<maxstrikes
    EVALUATION=imagen(POINT(1,2), (POINT(1,1)- coordinate));  
    EVPOINT=[POINT(1,2), (POINT(1,1)- coordinate)];
    PUPLEFT=[PUPLEFT;EVPOINT]; 
    if EVALUATION>thresholdH
        strikes=strikes+1;
        coordinate=coordinate+1; 
    else
        strikes=0;
        coordinate=coordinate+1;
    end
end

Ledge=PUPLEFT(1:(length(PUPLEFT)-maxstrikes),:);
TOTLENGTH=[Redge;Ledge];
DIAMETER=length(TOTLENGTH);
%imshow(imagen); hold on; plot(TOTLENGTH(:,2), TOTLENGTH(:,1),'w');
