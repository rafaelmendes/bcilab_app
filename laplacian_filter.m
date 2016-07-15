close all;

% The path to the dataset
PATH_TO_DATASET = '/home/rafael/Documents/eeg_data/eeglab_data.set';

% List of channels we will analize
CHANNEL_NAME = 'C3'

% List of channels close to CHANNEL_NAME (for laplacian computation)
ADJ_CHANNELS = ['T3' 'F3' 'CZ' 'P3'];

% Band-Pass Filter Design:
LOWER_CUTOFF = 1;
UPPER_CUTOFF = 35;

% Loads the dataset into 'EEG'
EEG_RAW = io_loadset(PATH_TO_DATASET);

% EEGDATA band-pass filtering:
EEG_FILT = pop_eegfilt( EEG_RAW, LOWER_CUTOFF, 0, [], [0]);
EEG_FILT = pop_eegfilt( EEG_FILT, 0, UPPER_CUTOFF, [], [0]);

% Change Channel Reference:
EEG_LAP_C3 = pop_reref(EEG_FILT, 'channel', {ADJ_CHANNELS})

% Select on channel from each dataset:
EEG_LAP_1ch = pop_select( EEG_LAP_C3,'channel',{CHANNEL_NAME});
EEG_FILT_1ch = pop_select( EEG_FILT,'channel',{CHANNEL_NAME});


% Plot the data
pop_eegplot( EEG_LAP_1ch )
pop_eegplot( EEG_FILT_1ch )
