%threshold= input('Enter color threshold:  ');
PUPDOWN=[]; 
strikes=0;
coordinate=0;

%Searching inferior edge

while strikes<maxstrikes
    EVALUATION=imagen((POINT(1,2)+ coordinate), POINT(1,1));  
    EVPOINT=[(POINT(1,2)+coordinate), POINT(1,1)];
    PUPDOWN=[PUPDOWN;EVPOINT]; 
    if EVALUATION>thresholdV
        strikes=strikes+1;
        coordinate=coordinate+1; 
    else
        strikes=0;
        coordinate=coordinate+1;
    end
end

Infedge=PUPDOWN(1:(length(PUPDOWN)-maxstrikes),:);

%Searhing superior edge

PUPUP=[]; 
strikes=0;
coordinate=0;
while strikes<maxstrikes
    EVALUATION=imagen((POINT(1,2)- coordinate), POINT(1,1));  
    EVPOINT=[(POINT(1,2)- coordinate), POINT(1,1)];
    PUPUP=[PUPUP;EVPOINT]; 
    if EVALUATION>thresholdV
        strikes=strikes+1;
        coordinate=coordinate+1; 
    else
        strikes=0;
        coordinate=coordinate+1;
    end
end

Supedge=PUPUP(1:(length(PUPUP)-maxstrikes),:);
VERTOTLENGTH=[flipud(Supedge);Infedge(2:end,:)];
VERTDIAMETER=length(VERTOTLENGTH);
%imshow(imagen); hold on; plot(VERTOTLENGTH(:,2), VERTOTLENGTH(:,1),'w');


