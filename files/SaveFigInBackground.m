function SaveFigInBackground (figNumber, figLocation, closeOrNot)
saveas(figNumber, figLocation);
if (closeOrNot)
    close(figNumber);
end


end