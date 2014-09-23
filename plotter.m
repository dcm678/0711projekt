%Group R19 Bianca De, Willian McFadden, Dylan McGuire, Ryan Tan
%ENGR 0711 M/W 4:00-5:50
%Budny
%9/24/14
%Homework #5
%This program plots a set of data

clear
close all
while 1
    %obtain data file
    filename=input('Enter filename or press "q" to exit: ','s');
    if filename == 'q'
        break
    elseif filename == 'Q'
        disp('you suck at quitting.')
        continue
    elseif exist(filename) == 0
        disp('not a valid filename')
        continue
    else
        data=load(filename);
    end
   
    %parse the data
    [rows,cols] = size(data);
    if rows ~= 2 & cols ~= 2
        disp('Invalid data. Please try again.')
        continue
    elseif rows > cols %data stored in rows
        x = transpose(data(:,1));
        y = transpose(data(:,2));
    else %data stored in columns
        x = data(1,:);
        y = data(2,:);
    end
    
    %get the symbol to plot the data with
    symbol = menu('Select a symbol for the data points','Star','Circle','Dot','Hebrew','Pagan');
    switch symbol
        case 1
            symbol = '*';
        case 2
            symbol = 'o';
        case 3
            symbol = '.';
        case 4
            symbol = 'h';
        case 5
            symbol = 'p';
    end
    
    %get the color of the points
    color = 'bauble';
    while color == 'bauble'
        color = input('What is your favorite color? Black, Red, Blue, or Yellow? ','s');
        if strcmp(color,'black') == 1
            color = 'k';
        elseif strcmp(color,'red') == 1
            color = 'r';
        elseif strcmp(color,'blue') == 1
            color = 'b';
        elseif strcmp(color,'yellow') == 1
            color = 'y';
        else
            color = 'bauble';
            disp('Choose one of the four colors and be sure to spell it correctly. No caps.')
        end
    end
    
    %get the axis labels
    titles = 'Graph Info';
    prompt = {'Title','X-axis','Y-axis'};
    values = {'Title','X','Y'};
    labels = inputdlg(prompt,titles,1,values);
    
    %plot the data
    plot(x,y,strcat(color,symbol))
    title(labels(1))
    xlabel(labels(2))
    ylabel(labels(3))
end