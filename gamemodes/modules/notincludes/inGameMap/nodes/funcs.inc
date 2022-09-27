GetVcNodeIndexFromId(idd)
{
    foreach(new i : VC_Nodes)
    {
        if(VC_Nodes[i][vcNode_ID] == idd)
        return i;
    }
    return -1;
}

GetVcNodeIndexFromNodeId(MapNode:nodeid)
{
    foreach(new i : VC_Nodes)
    {
        if(VC_Nodes[i][vcNode_MapNodeID] == nodeid)
        return i;
    }
    return -1;
}