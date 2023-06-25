% Program to create a Women’s Empowerment Workshop 

% Clear the workspace and command window
clc;
clear;

% Define constants 
workshop_duration = 3;
participants_min = 40;
participants_max = 80;
workshop_room_capacity = 100;

% Prompt user for workshop title and description
workshop_title = input('Please enter the title of the workshop: ','s');
workshop_description = input('Please enter a short description of the workshop: ','s');

% Prompt user for workshop location
workshop_location = input('Please enter the workshop location: ','s');

% Display the workshop information
fprintf('\nWorkshop Information:\n');
fprintf('Title: %s\nDescription: %s\nLocation: %s\nDuration: %d hours\n', workshop_title, workshop_description, workshop_location, workshop_duration);

% Prompt user for a list of speakers
num_speakers = input('Please enter the number of speakers for the workshop: ');

all_speakers = strings(1,num_speakers);

for i = 1:num_speakers
    all_speakers(i) = input(sprintf('Please enter the name of speaker %d: ', i), 's');
end

% Display the list of speakers
fprintf('\nList of Speakers:\n');
for i = 1:num_speakers
    fprintf('Speaker %d: %s\n', i, all_speakers(i));
end
% Prompt user for registration information
workshop_registration = input('Please enter the registration information: ','s');

% Display the registration information
fprintf('\nRegistration Information:\n%s\n', workshop_registration);

% Prompt user for number of volunteers
num_volunteers = input('Please enter the number of volunteers required for the workshop: ');

all_volunteers = strings(1,num_volunteers);

% Prompt user for the list of volunteers
for i = 1:num_volunteers
    all_volunteers(i) = input(sprintf('Please enter the name of volunteer %d: ', i), 's');
end

% Display the list of volunteers
fprintf('\nList of Volunteers:\n');
for i = 1:num_volunteers
    fprintf('Volunteer %d: %s\n', i, all_volunteers(i));
end

% Prompt user for the workshop advertisement
workshop_advertisement = input('Please enter the workshop advertisement: ','s');

% Display the workshop advertisement
fprintf('\nWorkshop Advertisement:\n%s\n', workshop_advertisement);

% Prompt user for the expected number of participants
expected_num_participants = input('Please enter the estimated number of participants: ');

% Check if the expected number of participants is within the minimum and
% maximum limits
if expected_num_participants >= participants_min && expected_num_participants <= participants_max
    fprintf('\nNumber of participants meets expectation!\n')

% Check if the room capacity is enough
    if expected_num_participants > workshop_room_capacity
        fprintf('Room capacity is not enough for the expected number of participants. Please find a larger room.\n')
    else
        fprintf('Room capacity is sufficient.\n')
    end
else
    fprintf('Number of participants does not meet expectation. Please adjust advertisement.\n')
end

% Prompt user for the workshop agenda
workshop_agenda = input('Please enter the agenda for the workshop: ','s');

% Display the agenda
fprintf('\nWorkshop Agenda:\n%s\n', workshop_agenda);

% Prompt user for workshop materials
workshop_materials = input('Please enter any materials needed for the workshop: ','s');

% Display the materials
fprintf('\nWorkshop Materials:\n%s\n', workshop_materials);

% Prompt user for post-workshop survey
workshop_survey = input('Please enter a post-workshop survey to send to participants: ','s');

% Display the survey
fprintf('\nPost-Workshop Survey:\n%s\n', workshop_survey);

% Prompt user for post-workshop evaluation
workshop_evaluation = input('Please enter a post-workshop evaluation to send to speakers and volunteers: ','s');

% Display the evaluation
fprintf('\nPost-Workshop Evaluation:\n%s\n', workshop_evaluation);

% Prompt user for workshop feedback
workshop_feedback = input('Please enter a feedback form to send to participants: ','s');

% Display the feedback
fprintf('\nWorkshop Feedback:\n%s\n', workshop_feedback);

% Display a message that the Women’s Empowerment Workshop is set up
fprintf('\nThe Women’s Empowerment Workshop setup is complete!\n')