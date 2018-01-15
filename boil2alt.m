function altitude = boil2alt(boilTemp, degreeUnit)
% Creator: Eli Lerner
% boil2alt This function calculates the altitude based on the temperature of
%water boils in either degrees Celcius or Farenheit. Default is Farenheit
% 
% inputs: boilTemp= the temperature at which water boils.
% degreeUnit=Which unit of measurment the user wishes to use, Farenheit or
% Celsius. Default is Farenheit.
% input args: The boilTemp must be between 0 and 300.
% Degree unit must be entered as 'c','C','f', or 'F'.
% 
% outputs: altitude will be the height, in feet, that equals the given boil
% temp.

if nargin<1;
    error('First though shalt find the boil temp, then thou shalt input 2 terms, no more, no less. 3 shall thou not input, 4 is right out.')
elseif boilTemp<0 || boilTemp>300;
    error('input must be between 0 and 300 degrees')
elseif nargin==1 || degreeUnit=='f' || degreeUnit=='F';
    disp('Sigh... welcome to a non zero measuring system, Farenheit')
    
    P=exp((boilTemp-44.932)/49.161);
    altitude=((nthroot(P/29.921,5.2559)-1)/(-6.8753*10^-6));
    
elseif degreeUnit=='c' || degreeUnit=='C';
    disp('Congrats on switching to metric, you must be sooooo proud')
    Temp=RealUnits(boilTemp);
    P=exp((Temp-44.932)/49.161);
    altitude=((nthroot(P/29.921,5.2559)-1)/(-6.8753*10^-6));

elseif degreeUnit~='c' || degreeUnit~='C' || degreeUnit~='f' || degreeUnit~='F';
    error('Real units of measurment only please, no fancy Kelvin')
else
    error('I do not even begin to know how you got here')
end


    


end

function boilTemp=RealUnits(boilTemp)
% RealUnits: This subfunction converts between Celcius and Farenheit. 
% inputs: boilTemp, is the temperature the user entered in Celcius when
% they should have used Farenheit all along. 
% outputs: it outputs boilTemp as it is in Farenheit. 

boilTemp=boilTemp*9/5+32;
end

