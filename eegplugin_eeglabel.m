% eegplugin_eeglabel() - EEGLAB plugin for adding and editing events
%
% Usage:
%   >> eegplugin_edfplus(fig, trystrs, catchstrs)
%
% Inputs:
%   fig        - [integer]  EEGLAB figure
%   trystrs    - [struct] "try" strings for menu callbacks.
%   catchstrs  - [struct] "catch" strings for menu callbacks. 
%
%
% #-----------------------------------------------------------------------#
% # The EEGLABEL plug-in for EEGLAB v1.0                                  #
% #-----------------------------------------------------------------------#
% # Author:  German Gomez-Herrero <g.gomez@nin.knaw.nl>                   #
% #          Netherlands Institute for Neuroscience                       #
% #          Amsterdam, The Netherlands                                   #
% #-----------------------------------------------------------------------#
%
% See also: EEGLABEL, POP_EEGLABEL

% Date created: 01.12.2011
% Last modified: 01.12.2011

%123456789012345678901234567890123456789012345678901234567890123456789012

% Copyright (C) 2010 German Gomez-Herrero, g.gomez@nin.knaw.nl
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

function vers = eegplugin_eeglabel(fig, try_strings, catch_strings)

vers = '1.0 (R101201)';
if nargin < 3
    error('eegplugin_eeglabel requires 3 input arguments');
end

% add plugin folder to path
% -------------------------
addpath(genpath(fileparts(mfilename('fullpath'))));

% find import menu
% ---------------------
toolsmenu = findobj(fig, 'tag', 'tools');

% construct command
%---------------------
cmd_add = [ try_strings.no_check 'LASTCOM = pop_eeglabel(EEG,''add'');' catch_strings.add_to_hist ];
cmd_remove = [ try_strings.no_check 'LASTCOM = pop_eeglabel(EEG,''remove'');' catch_strings.add_to_hist ];


% add menu
%----------
uimenu(toolsmenu,'label','Add events','callback',cmd_add,'separator','on');
uimenu(toolsmenu,'label','Remove events','callback',cmd_remove);

end

