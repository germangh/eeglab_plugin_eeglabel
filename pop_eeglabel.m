function [com] = pop_eeglabel(EEG, type)
% pop_eeglabel() -  Opens an EEGPLOT window with a button that allowes the
% labeling of EEG periods. 
%
% Usage:
%   >> [com] = pop_eeglabel(EEG)
%
% Inputs:
%   EEG - EEGLAB dataset structure
%   type - Either 'add' to add events or 'remove' to remove events
%
% Outputs:
%   com - The equivalent command line command
%
% Author: German Gomez-Herrero <german.gomezherrero@tut.fi>
%         Institute of Signal Processing
%         Tampere University of Technology, 2008
%
% See also:
%   EEGLAB
%

% Copyright (C) <2010>  <German Gomez-Herrero>
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


com = '';
if nargin < 1, 
    help pop_eeglabel;
    return;
end

command = ...
    sprintf([ '[EEGTMP LASTCOM] = eeglabel(EEG,eegplot2event(TMPREJ,-1),''%s'');',...
    'if ~isempty(LASTCOM),' ...
    '  [ALLEEG EEG CURRENTSET tmpcom] = pop_newset(ALLEEG, EEGTMP, CURRENTSET);' ...
    '  if ~isempty(tmpcom),' ...
    '     EEG = eegh(LASTCOM, EEG);' ...
    '     eegh(tmpcom);' ...
    '     eeglab(''redraw'');' ...
    '  end;' ...
    'end;' ...
    'clear EEGTMP tmpcom;' ], type);

if strcmpi(type, 'add'),
    button_label = 'ADD LABEL';
elseif strcmpi(type, 'remove'),
    button_label = 'REMOVE LABELS';
else
    error('pop_eeglabel:unknownType',...
        'Unknown operation type ''%s''', type);
end

% call eegplot with the appropriate options
eegplot( EEG.data, 'srate', EEG.srate, 'title', 'Scroll channel activities -- eegplot()', ...
			 'limits', [EEG.xmin EEG.xmax]*1000 , 'command', command, ...
             'butlabel', button_label,...
             'events', EEG.event); 

com = [ com sprintf('pop_eeglabel( %s);', inputname(1)) ]; 
return;

