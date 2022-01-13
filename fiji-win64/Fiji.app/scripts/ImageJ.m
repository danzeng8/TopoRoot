function ImageJ(open_imagej)
    %% This script displays a notice that the MATLAB update site is required.
    %% It will open a link to the ImageJ wiki page on following update sites if desired.
    %% It is intended to be included in base ImageJ distributions to notify users of
    %% the existence of the MATLAB update site.
    % Author: Mark Hiner

    display_update_site = questdlg({'Use of ImageJ-MATLAB requires the update site:' 'http://sites.imagej.net/MATLAB/' 'Would you like to open the ImageJ wiki page on enabling update sites?'},'Update site required','Yes', 'No','Yes');
    switch display_update_site
        case 'Yes'
            web('http://www.imagej.net/How_to_follow_a_3rd_party_update_site','-browser')
            disp('Please add this update site: http://sites.imagej.net/MATLAB/')
        case 'No'
            disp('ImageJ-MATLAB update site not enabled.')
    end
end
