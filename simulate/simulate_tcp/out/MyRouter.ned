import approx.ipv4flow.FlowRouter;
import approx.ipv4flow.ecmp.ECMPRoutingTable;

module MyRouter extends FlowRouter
{
    parameters:
        int SEED=default(123);
    submodules:
        routingTable: ECMPRoutingTable {
            parameters:
                @display("p=53,225;is=s");
                IPForward = IPForward;
                forwardMulticast = forwardMulticast;
                routingFile = routingFile;
                seed = SEED;
                
        }
}