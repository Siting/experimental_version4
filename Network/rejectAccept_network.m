function[choice, sensorSelection] = rejectAccept_network(errorMatrix, criteria,  nodeMap, sensorMetaDataMap, linkMap, stage, sensorSelection)

% studyLinks = [nodeMap(nodeID).incomingLinks; nodeMap(nodeID).outgoingLinks];
% studySensors = [];
% keyboard
% for i = 1 : length(studyLinks)
%     studySensors = [studySensors linkMap(studyLinks(i)).sensors];
% end
% A = (studySensors == cell2mat(sensorMetaDataMap.keys));

global thresholdVector    

% compute L2 distance
[distances] = computeL2Distance_network(errorMatrix);
A = ones(1,2);
if min(distances<=thresholdVector(stage,:))==0
    choice = 'reject';
%     % for criteria selection=====
%     if distances(1)>thresholdVector(stage,1)
%         A(1) = 0;
%     end
%     if distances(2)>thresholdVector(stage,2)
%         A(2) = 0;
%     end
%     %=======================
else
    choice = 'accept';
end
% %=========================
% sensorSelection = [sensorSelection; A];
% %=========================
