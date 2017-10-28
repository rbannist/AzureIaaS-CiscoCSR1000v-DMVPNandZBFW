***Cisco CSR 1000v-underpinned Network Security on Azure***

***A technology overview, a suggested deployment framework, and
deployment instructions.***

#### ***Introduction and Target Audience***

In CY16 Cisco enjoyed a \~56% share of the Ethernet Switch market, a
\~42% share of the combined Enterprise and Service Provider Router
markets, and \~13% of the highly fragmented \[next-gen\] firewall market
– all number one positions.

Note. This is after some market share loss in recent years so in reality
the install base is a greater %.

When combining those numbers with the Cisco Networking Academy
programme, Cisco’s significant technical leadership inc. R&D investment,
and the large number of trained Cisco Certified engineers out there,
it’s fair to say that most customers that we work with will likely have
a significant investment in and reliance on Cisco technologies and
solutions.

Investment spans across people, process, and technology. It boils down
to such things as open and proprietary technology adoption, adoption of
Cisco’s own and Cisco product-supporting software tooling,
training/certifications/hiring and onboarding processes, architectural
principles, and operational processes and documentation (i.e. validated
and approved ‘products’ and ITIL-aligned practices).

Customers with an investment in Cisco Routing, Switching, and Security
solutions often wish to extend at least parts of their operational model
into public cloud environments so that they don’t have a model
per-cloud/environment. Also, in some cases, they are getting value from
a specific Cisco technology/feature and/or they have an architectural
principle/pre-validated and approved service offering that dictates that
they must use a specific Cisco product/feature in all deployment
environments.

The focus of this document is on helping you to understand and build a
Dynamic Multipoint Virtual Private Network (DMVPN)-overlay between Azure
Regions/customer-defined zones spread across Azure Regions. DMVPN is an
IPSec-underpinned VPN solution that is adopted by many Cisco customers
and is available on Cisco routing platforms.

We will be using the Cloud Services Router 1000v (CSR 1000v) to achieve
our aim. The CSR 1000v is a virtual form factor router. The CSR 1000v
can be hosted on many private and public cloud platforms including
Microsoft Azure.

#### ***When extending service deployment across a hybrid, multi-cloud setting, Cisco’s cloud-agnostic features and solutions delivered on the CSR 1000v running the IOS-XE operating system include:***

  ---------------------------------------------------------------------------------------------------------------------------------
  **Category**                                            **Feature(s) or Solution(s)**
  ------------------------------------------------------- -------------------------------------------------------------------------
  Identity                                                Authentication, Authorization, and Accounting (AAA)
                                                          
                                                          -   Terminal Access Controller Access-Control System Plus (TACACS+)
                                                          
                                                              -   The items above are coupled with Identity Services Engine (ISE)
                                                          

  Routing                                                 Virtual Routing and Forwarding (VRF) inc. VRF-Lite/Multi-VRF

                                                          Interior Gateway Protocols (IGP) (public cloud = over tunnels)
                                                          
                                                          -   Open Shortest Path First (OSPF)
                                                          
                                                          -   Enhanced Interior Gateway Routing Protocol (EIGRP)
                                                          
                                                          -   Intermediate System-to-Intermediate System (IS-IS)
                                                          

                                                          Exterior Gateway Protocols (EGP)
                                                          
                                                          -   Border Gateway Protocol (BGP) inc. Multiprotocol BGP
                                                          

                                                          Locator/Identity Separation Protocol (LISP)

                                                          Overlay Transport Virtualization (OTV)

  Tunneling and Virtual Private Networks                  Dynamic Multipoint Virtual Private Network (DMVPN)

                                                          FlexVPN

                                                          Easy VPN

                                                          Group Encrypted Transport VPN (GETVPN)

                                                          Virtual eXtensible Local Area Network (VXLAN)

                                                          \[Multipoint\] Generic Routing Encapsulation (GRE/mGRE)

                                                          Layer 2 Tunneling Protocol Version 3 (L2TPv3)

                                                          Ethernet Virtual Connection (EVC)

  Tag/Label Switching                                     Multiprotocol Label Switching (MPLS)
                                                          
                                                          -   MPLS Virtual Private Networking (MPLS VPN)
                                                          
                                                          -   MPLS Traffic Engineering (MPLS TE)
                                                          
                                                          -   MPLS Quality of Service (MPLS QoS)
                                                          
                                                          -   Ethernet over MPLS (EoMPLS)
                                                          
                                                          -   Virtual Private LAN Service (VPLS)
                                                          

  Packet Inspection                                       Network-Based Application Recognition Version 2 (NBAR2)

                                                          Application Visibility and Control (AVC)

  Packet Filtering and Context-based Firewall/Filtering   Access Control List (ACL)

                                                          Zone-based Firewall (ZBFW)

                                                          TrustSec
                                                          
                                                          -   Security Group Tag (SGT)
                                                          
                                                          -   Security Group ACL (SGACL)
                                                          
                                                          -   SGT Exchange Protocol (SXP)
                                                          

  Multicast (public cloud = tunneled)                     Internet Group Management Protocol (IGMP)

                                                          Protocol Independent Multicast (PIM)

  Traffic Redirection                                     Policy Based Routing (PBR)

                                                          Web Cache Communication Protocol (WCCP)

                                                          AppNav

  Performance Monitoring and Control                      \[Hierarchical\] Modular Quality of Service (QoS)

                                                          Simple Network Management Protocol (SNMP)

                                                          Syslog

                                                          \[Flexible\] NetFlow

                                                          Internet Protocol Service Level Agreement (IPSLA)

  Other                                                   Network Address Translation (NAT)

                                                          Bidirectional Forwarding Detection (BFD)

                                                          Domain Name System (DNS)

                                                          NETCONF

                                                          Embedded Event Manager (EEM)

                                                          Network Function Virtualization (NFV)

                                                          Smart Call Home
  ---------------------------------------------------------------------------------------------------------------------------------

#### ***A table that lists Microsoft Azure and Cisco IOS-XE features and functions that are \[almost\] synonymous alongside each other can be found below:***

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Microsoft Azure (Fabric-wide mgmt)**                                 **Cisco IOS-XE (Per-hop mgmt)**
  ---------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Resource Name/ID                                                       Hostname

  Azure Active Directory (AAD)                                           AAA and TACACS+ (+ ISE)

  Network Interface (NIC)                                                Interface

  Virtual Network (VNET)                                                 Virtual Routing and Forwarding Table (VRF)

  Subnet                                                                 Routed Interface

  VNET Peering                                                           Inter-VRF Route Leaking

  User Defined Route table (UDR)                                         Static Routes and Route Redistribution in ‘Customer’ VRF\
                                                                         (Route to ‘None’ = Route to Null0 interface)

  INTERNET route                                                         Global Routing Table (GRT)/’Common Services’ VRF to ‘Customer’ VRF 0.0.0.0/0 (default) route leaking

  BGP route                                                              Prefix learned from BGP neighbor(s)\
                                                                         In some cases, also target ‘Customer’ VRF (Route Distinguishers and Route Targets)

  Service Endpoint                                                       Tunnel with IGP (and Route Filtering)

  Endpoint Access Control List (ACL)                                     Access Control List (ACL)

  Network Security Group (NSG)                                           Zone-based Firewall (ZBFW) \[with ACL inc. Network Object Groups\], or Cisco TrustSec Security Group Tags (SGT) and Security Group ACLs (SGACL)

  NSG Default Tags and Service Tags for NSGs                             Templated Network Object Groups, Templated ZBFW Zones, or Templated/Propagated TrustSec SGTs

  Application Security Group (ASG)                                       \[ZBFW with\] Automated ACL with Custom Object Groups or Cisco TrustSec SGT Static/Dynamic Classification with SGT Mapping Propagation (+ ISE VM for a comparable capability)

  Augmented Security Rules for NSGs                                      Network Object Groups and Service Object Groups and/or ZBFW Class Maps and Policy Maps

  Marketplace – Next-Gen Firewall ISV Solution – ‘Application Control’   Application Visibility and Control (AVC) - Network Based Application Recognition 2 (NBAR2) and ACLs

  NSG Data plane logs and analytics                                      Netflow/Flexible-Netflow (and a Netflow Collector for a comparable capability)

  VPN Gateway                                                            ‘crypto’ and ‘tunnel’

  VPN Gateway peer count limit                                           ‘crypto call admission’ (IKE Phase 1)

  Restricted/no Broadcast or Multicast                                   Feature/protocol support for Non-broadcast multiple access networks (NBMA)

  Public IP (PIP)                                                        Static Network Address Translation (NAT)

  ‘Route = INTERNET’ PAT/NAT Pool addresses                              Port Address Translation (PAT) - ‘overload’ on Outside interface

  Load Balancer NAT Rule                                                 NAT and Static Port Address Translation
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This document is aimed at an audience of Azure IaaS technical
specialists and the Cisco elements hit a ‘201’ level. i.e. you will be
exposed to more of the ‘What?’ rather than the ‘How?’.

While we’re not aiming for a full production-grade setup, to be
‘sensible’ in the approach, you will be exposed to a few concepts and
features beyond those that come together to form DMVPN. This will
include a relatively significant exposure to Zone Based Firewall (ZBFW)
as the routers that we will be provisioning will be exposed to the
internet so they, and VMs behind them, need to be protected from attacks
up to a basic level.

#### ***Features and Solutions In Scope in this Document***

#### 

  **Category**                                            **Feature(s)**
  ------------------------------------------------------- ---------------------------------------------------------
  Identity                                                Authentication, Authorization, and Accounting (AAA)
  Routing                                                 Virtual Routing and Forwarding (VRF)
                                                          Open Shortest Path First (OSPF)
                                                          Border Gateway Protocol (BGP)
  Tunneling and Virtual Private Networks                  Dynamic Multipoint Virtual Private Network (DMVPN)
                                                          Virtual eXtensible Local Area Network (VXLAN)
                                                          Multipoint Generic Routing Encapsulation (mGRE)
  Packet Inspection                                       Network-Based Application Recognition Version 2 (NBAR2)
  Packet Filtering and Context-based Firewall/Filtering   Access Control List (ACL)
                                                          Zone-based Firewall (ZBFW)
  Other                                                   Network Address Translation (NAT)
                                                          Bidirectional Forwarding Detection (BFD)
                                                          Next Hop Resolution Protocol (NHRP)
                                                          Domain Name System (DNS)
                                                          Embedded Event Manager (EEM)
                                                          Smart Call Home

#### ***What is DMVPN and what are its USPs?***

Let’s take 3 sites, each with a pair of Active/Active HA routers. A
small network. If we use *normal* IPSec site-to-site VPNs (with or
without GRE tunnels underneath) to build a full mesh of encrypted
tunnels we would need:

-   24 tunnel interfaces.

-   12 subnets.

-   24 IP addresses.

**Full mesh with ‘Site 3-to-Site 2’ traffic flow highlighted (red
line)**

If we choose to build a partial mesh instead - resulting in a few less
tunnel interfaces and therefore a few less subnets and IP addresses - we
must accept hair-pinning of traffic via a *central site* in cases when
sites with IP flows between them don’t have direct site-to-site VPNs.

**Partial mesh with Site 3-to-Site 2 traffic flow highlighted**

A partial mesh results in:

-   Extra bandwidth utilisation/a need for extra bandwidth provision at
    the central, ‘hub’, site.

    -   Higher costs if charges apply.

-   Additional latency between endpoints when traffic flows do occur.

DMVPN combines mGRE tunneling and IPsec encryption with Next-Hop
Resolution Protocol (NHRP) routing in a manner that addresses the
dilemma described above. DMVPN makes building a IPSec VPN overlay
network simple and scalable.

#### **DMVPN Components**

  **Component**                                                     **What it’s for**
  ----------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  mGRE tunnel interface                                             This allows a single GRE interface on each router to support multiple IPsec tunnels which simplifies the size and complexity of each router’s configuration. Classic GRE tunnels are point-to-point. mGRE allows a tunnel to have multiple destinations.
  Dynamic discovery of IPsec tunnel endpoints and crypto profiles   This eliminates the need to configure static maps defining every pair of IPsec peers.
  NHRP                                                              This is a Client-Server protocol. ‘Hub’ site routers are Servers and ‘Spoke’ site routers are Clients. NHRP allows spoke routers to be deployed with dynamically assigned ‘public IP addresses’ (these can be both RFC1918 and non-RFC1918 addresses). Hub routers maintain an NHRP database of the public interface addresses of each spoke router. Each spoke router registers its real address when it boots; when it needs to build direct tunnels with other spokes, it queries the NHRP database for real addresses of the destination spokes. NHRP offers a routing optimisation scheme inside NBMA (non-broadcast multiple-access) networks which is essentially what the underlying hub-and-spoke mGRE tunneling provides.

#### **DMVPN USPs**

+-----------------------------------+-----------------------------------+
| **Attribute**                     | **Detail**                        |
+===================================+===================================+
| On-demand full mesh connectivity  | Massively scalable.               |
| with simple hub-and-spoke         |                                   |
| configuration                     | Lower admin costs - A dramatic    |
|                                   | simplification of the router      |
|                                   | configurations and a massive      |
|                                   | reduction in the number of VPN    |
|                                   | configuration lines.              |
|                                   |                                   |
|                                   | > In our example it’s now: 6      |
|                                   | > tunnel interfaces total for 1   |
|                                   | > overlay across 3 sites with HA  |
|                                   | > routers in each site.           |
|                                   |                                   |
|                                   | All spokes in the same subnet     |
|                                   | (i.e. 4 spokes with 2 hubs = 6 IP |
|                                   | addresses).                       |
|                                   |                                   |
|                                   | The option to overlay encryption  |
|                                   | on a tunnel or not (i.e.          |
|                                   | mGRE-only or IPSec-on-mGRE        |
|                                   | tunnel).                          |
|                                   |                                   |
|                                   | > Mix encrypted and non-encrypted |
|                                   | > within a single topology.       |
|                                   |                                   |
|                                   | VRF-aware and routing-based       |
|                                   | failover.                         |
+-----------------------------------+-----------------------------------+
| ‘Zero-touch’ deployment for       | Adding new spokes to the VPN      |
| adding remote sites               | requires no changes at the hub.   |
|                                   |                                   |
|                                   | A centralised configuration       |
|                                   | controls split-tunneling          |
|                                   | behaviour at a spoke.             |
+-----------------------------------+-----------------------------------+
| Reduced latency and bandwidth     | Automatic IPsec triggering for    |
| savings.                          | building an IPsec tunnel -        |
|                                   | dynamic spoke-to-spoke tunnels.\  |
|                                   | \                                 |
|                                   | Support for IP Multicast over     |
|                                   | tunnels.                          |
+-----------------------------------+-----------------------------------+
| Extensive QoS support             | Traffic shaping (per-spoke or     |
|                                   | per-‘spoke group’).               |
|                                   |                                   |
|                                   | Policing (per-spoke).             |
|                                   |                                   |
|                                   | Hub-to-spoke and spoke-to-spoke   |
|                                   | policies.                         |
|                                   |                                   |
|                                   | QoS templates attached            |
|                                   | dynamically/automatically to      |
|                                   | tunnels as they come up.          |
+-----------------------------------+-----------------------------------+

#### ***The Environment/Topology that we’re going to be working with***

#### **High-level**

#### **Per-site – a focus on ‘Site 1 - DevQA’**

\*1 = DMZ and Inside subnets via CSR 1000v Outside Interface IP Address

\*2 = Outside and Inside subnets via CSR 1000v DMZ Interface IP Address

\*3 = DMZ and Outside subnets via CSR 1000v Inside Interface IP Address

#### ***Preparing for the Deployment***

**An Azure Resource Group (RG) and Resource naming convention is needed
that allows for:**

-   A set of RGs per-zone/service in each region in scope.

    -   Storage Accounts - Disks.

    -   Storage Accounts - Diagnostics.

    -   Public IPs (if applicable).

    -   Connectivity Test VMs inc. any associated Resources such as NICs
        (optional).

-   A primary CSR 1000v RG per-zone/service in each region.

    -   Child Resources:

        -   Virtual Networks.

        -   User Defined Route Tables.

-   Two *rolling ID count* RGs for initial and subsequent CSR 1000v
    deployments per-zone/service in each region if deploying CSR 1000v
    VMs from the Azure Marketplace.

    -   Child Resources:

        -   CSR 1000v VMs – A and B nodes.

        -   CSR 1000v NICs

> **Or**

-   One RG for initial and subsequent CSR 1000v deployments
    per-zone/service in each region if deploying CSR 1000v VMs using the
    templates in the repository: .

    -   Child Resources:

        -   CSR 1000v VMs – A and B nodes.

        -   CSR 1000v NICs

#### ***An example RG naming scheme for separate Dev+QA and Prod network/VPN overlays across 3 Azure Regions for a fictional ‘AAA Application’:***

-   *Storage Accounts - Disks.*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-sdisk-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ----------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-sdisk-rg01
                     North Europe            rb-ne-aaa-dqa-sdisk-rg01
                     East US                 rb-eus-aaa-dqa-sdisk-rg01
  AAA – Prod         West Europe             rb-we-aaa-prod-sdisk-rg01
                     North Europe            rb-ne-aaa-prod-sdisk-rg01
                     East US                 rb-eus-aaa-prod-sdisk-rg01

-   *Storage Accounts – Diagnostics.*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-sdiag-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ----------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-sdiag-rg01
                     North Europe            rb-ne-aaa-dqa-sdiag-rg01
                     East US                 rb-eus-aaa-dqa-sdiag-rg01
  AAA - Prod         West Europe             rb-we-aaa-prod-sdiag-rg01
                     North Europe            rb-ne-aaa-prod-sdiag-rg01
                     East US                 rb-eus-aaa-prod-sdiag-rg01

Note. At this time, the Marketplace template for the CSR 1000v does not
allow for putting CSR 1000v boot diagnostics logs in a separate storage
account to the OS disks. These resource groups names are added/defined
as a future-proofing exercise or for if you would like to manually move
the logging destination.

-   *Public IPs – CSR 1000v Management.*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-pipm-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ---------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-pipm-rg01
                     North Europe            rb-ne-aaa-dqa-pipm-rg01
                     East US                 rb-eus-aaa-dqa-pipm-rg01
  AAA - Prod         West Europe             rb-we-aaa-prod-pipm-rg01
                     North Europe            rb-ne-aaa-prod-pipm-rg01
                     East US                 rb-eus-aaa-prod-pipm-rg01

-   *Public IPs – CSR 1000v ‘Outside’ Interfaces (optional).*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-pipd-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ---------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-pipd-rg01
                     North Europe            rb-ne-aaa-dqa-pipd-rg01
                     East US                 rb-eus-aaa-dqa-pipd-rg01
  AAA - Prod         West Europe             rb-we-aaa-prod-pipd-rg01
                     North Europe            rb-ne-aaa-prod-pipd-rg01
                     East US                 rb-eus-aaa-prod-pipd-rg01

-   *Connectivity Test VMs and all their Resources such as Storage
    Accounts and NICs (optional).*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-tstvm-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ----------------------------
  AAA - Dev and QA   West Europe (WE)        rb-we-aaa-dqa-tstvm-rg01
                     North Europe (NE)       rb-ne-aaa-dqa-tstvm-rg01
                     East US (EUS)           rb-eus-aaa-dqa-tstvm-rg01
  AAA - Prod         West Europe (WE)        rb-we-aaa-prod-tstvm-rg01
                     North Europe (NE)       rb-ne-aaa-prod-tstvm-rg01
                     East US (EUS)           rb-eus-aaa-prod-tstvm-rg01

-   *A primary ‘Common CSR 1000v Resources’ RG per-site/zone/service to
    be deployed.*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-csrcr-rg&lt;ID&gt;**

  Service/App Zone   Azure Region (‘Site’)   RG Name Examples
  ------------------ ----------------------- ----------------------------
  AAA - Dev and QA   West Europe (WE)        rb-we-aaa-dqa-csrcr-rg01
                     North Europe (NE)       rb-ne-aaa-dqa-csrcr-rg01
                     East US (EUS)           rb-eus-aaa-dqa-csrcr-rg01
  AAA - Prod         West Europe (WE)        rb-we-aaa-prod-csrcr-rg01
                     North Europe (NE)       rb-ne-aaa-prod-csrcr-rg01
                     East US (EUS)           rb-eus-aaa-prod-csrcr-rg01

-   *A rolling RG ID count for initial and subsequent CSR 1000v
    deployments.*

    -   Naming Standard =
        **&lt;orgprefix&gt;-&lt;regioncode&gt;-&lt;service&gt;-&lt;stage&gt;-csrvm-rg&lt;ID&gt;**

+-----------------+-----------------+-----------------+-----------------+
| Service/App     | Azure Region    | CSR 1000v HA    | RG Name         |
| Zone            | (‘Site’)        | Node            | Examples        |
+=================+=================+=================+=================+
| AAA - Dev and   | West Europe     | A               | rb-we-aaa-dqa-c |
| QA              | (WE)            |                 | srvm-rg101\     |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-we-aaa-dqa-c |
|                 |                 |                 | srvm-rg102      |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+
|                 | North Europe    | A               | rb-ne-aaa-dqa-c |
|                 | (NE)            |                 | srvm-rg101\     |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-ne-aaa-dqa-c |
|                 |                 |                 | srvm-rg102      |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+
|                 | East US (EUS)   | A               | rb-eus-aaa-dqa- |
|                 |                 |                 | csrvm-rg101\    |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-eus-aaa-dqa- |
|                 |                 |                 | csrvm-rg102     |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+
| AAA - Prod      | West Europe     | A               | rb-we-aaa-prod- |
|                 | (WE)            |                 | csrvm-rg101\    |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-we-aaa-prod- |
|                 |                 |                 | csrvm-rg102     |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+
|                 | North Europe    | A               | rb-ne-aaa-prod- |
|                 | (NE)            |                 | csrvm-rg101\    |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-ne-aaa-prod- |
|                 |                 |                 | csrvm-rg102     |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+
|                 | East US (EUS)   | A               | rb-eus-aaa-prod |
|                 |                 |                 | -csrvm-rg101\   |
|                 |                 |                 | ‘111’ ‘121' 1n1 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 | B               | rb-eus-aaa-prod |
|                 |                 |                 | -csrvm-rg102    |
|                 |                 |                 |                 |
|                 |                 |                 | ‘112’ ‘122’ 1n2 |
+-----------------+-----------------+-----------------+-----------------+

#### ***Individual Resource naming examples for the same topology as above:***

-   *Storage Accounts – Disks.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;&lt;stage&gt;sadisk&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- ------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-sdisk-rg01     rbweaaadqasadisk001
                     North Europe            rb-ne-aaa-dqa-sdisk-rg01     rbneaaadqasadisk001
                     East US                 rb-eus-aaa-dqa-sdisk-rg01    rbeusaaadqasadisk001
  AAA - Prod         West Europe             rb-we-aaa-prod-sdisk-rg01    rbweaaaprodsadisk001
                     North Europe            rb-ne-aaa-prod-sdisk-rg01    rbneaaaprodsadisk001
                     East US                 rb-eus-aaa-prod-sdisk-rg01   rbeusaaaprodsadisk001

-   *Storage Accounts – Diagnostics.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;&lt;stage&gt;sadiag&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- ------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-sdisk-rg01     rbweaaadqasadiag001
                     North Europe            rb-ne-aaa-dqa-sdisk-rg01     rbneaaadqasadiag001
                     East US                 rb-eus-aaa-dqa-sdisk-rg01    rbeusaaadqasadiag001
  AAA - Prod         West Europe             rb-we-aaa-prod-sdisk-rg01    rbweaaaprodsadiag001
                     North Europe            rb-ne-aaa-prod-sdisk-rg01    rbneaaaprodsadiag001
                     East US                 rb-eus-aaa-prod-sdisk-rg01   rbeusaaaprodsadiag001

Note. Please read to the note under the ‘Storage Accounts –
Diagnostics.’ if you haven’t already done so.

-   *Public IPs - Management.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-pipm&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                   Resource Name Examples
  ------------------ ----------------------- --------------------------- ------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-pipm-rg01     rb-we-aaa-dqa-pipm01
                                                                         rb-we-aaa-dqa-pipm02
                     North Europe            rb-ne-aaa-dqa-pipm-rg01     rb-ne-aaa-dqa-pipm01
                                                                         rb-ne-aaa-dqa-pipm02
                     East US                 rb-eus-aaa-dqa-pipm-rg01    rb-eus-aaa-dqa-pipm01
                                                                         rb-eus-aaa-dqa-pipm02
  AAA - Prod         West Europe             rb-we-aaa-prod-pipm-rg01    rb-we-aaa-prod-pipm01
                                                                         rb-we-aaa-prod-pipm02
                     North Europe            rb-ne-aaa-prod-pipm-rg01    rb-ne-aaa-prod-pipm01
                                                                         rb-ne-aaa-prod-pipm02
                     East US                 rb-eus-aaa-prod-pipm-rg01   rb-eus-aaa-prod-pipm01
                                                                         rb-eus-aaa-prod-pipm02

-   *Public IPs – CSR 1000v Outside Interfaces (Data plane).*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-pipd&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                   Resource Name Examples
  ------------------ ----------------------- --------------------------- ------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-pipd-rg01     rb-we-aaa-dqa-pipd01
                                                                         rb-we-aaa-dqa-pipd02
                     North Europe            rb-ne-aaa-dqa-pipd-rg01     rb-ne-aaa-dqa-pipd01
                                                                         rb-ne-aaa-dqa-pipd02
                     East US                 rb-eus-aaa-dqa-pipd-rg01    rb-eus-aaa-dqa-pipd01
                                                                         rb-eus-aaa-dqa-pipd02
  AAA - Prod         West Europe             rb-we-aaa-prod-pipd-rg01    rb-we-aaa-prod-pipd01
                                                                         rb-we-aaa-prod-pipd02
                     North Europe            rb-ne-aaa-prod-pipd-rg01    rb-ne-aaa-prod-pipd01
                                                                         rb-ne-aaa-prod-pipd02
                     East US                 rb-eus-aaa-prod-pipd-rg01   rb-eus-aaa-prod-pipd01
                                                                         rb-eus-aaa-prod-pipd02

-   *Connectivity Test VMs (1 per-zone/site for ‘Inside’ subnet or 2
    per-zone/site for ‘Inside’ and ‘DMZ’ subnets).*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-tstvm&lt;id&gt;**
        (15 character limit:
        **&lt;service&gt;&lt;regioncode&gt;tst&lt;id&gt;**)

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- -----------------------------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-tstvm-rg01     rb-we-aaa-dqa-tstvm01 (15: aaadqawetst01)
                     North Europe            rb-ne-aaa-dqa-tstvm-rg01     rb-ne-aaa-dqa-tstvm01 (15: aaadqanetst01)
                     East US                 rb-eus-aaa-dqa-tstvm-rg01    rb-eus-aaa-dqa-tstvm01 (15: aaadqaeustst01)
  AAA - Prod         West Europe             rb-we-aaa-prod-tstvm-rg01    rb-we-aaa-prod-tstvm01 (15: aaaprodwetst01)
                     North Europe            rb-ne-aaa-prod-tstvm-rg01    rb-ne-aaa-prod-tstvm01 (15: aaaprodnetst01)
                     East US                 rb-eus-aaa-prod-tstvm-rg01   rb-eus-aaa-prod-tstvm01 (15: aaaprodeustst01)

-   *Test VMs’ NICs.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-tstvm&lt;id&gt;-nic&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- -------------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-tstvm-rg01     rb-we-aaa-dqa-tstvm01-nic01
                     North Europe            rb-ne-aaa-dqa-tstvm-rg01     rb-ne-aaa-dqa-tstvm01-nic01
                     East US                 rb-eus-aaa-dqa-tstvm-rg01    rb-eus-aaa-dqa-tstvm01-nic01
  AAA - Prod         West Europe             rb-we-aaa-prod-tstvm-rg01    rb-we-aaa-prod-tstvm01-nic01
                     North Europe            rb-ne-aaa-prod-tstvm-rg01    rb-ne-aaa-prod-tstvm01-nic01
                     East US                 rb-eus-aaa-prod-tstvm-rg01   rb-eus-aaa-prod-tstvm01-nic01

-   *Availability Sets for CSR 1000v VMs.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-csrvm-as&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- ----------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrcr-rg01     rb-we-aaa-dqa-csrvm-as01
                     North Europe            rb-ne-aaa-dqa-csrcr-rg01     rb-ne-aaa-dqa-csrvm-as01
                     East US                 rb-eus-aaa-dqa-csrcr-rg01    rb-eus-aaa-dqa-csrvm-as01
  AAA - Prod         West Europe             rb-we-aaa-prod-csrcr-rg01    rb-we-aaa-prod-csrvm-as01
                     North Europe            rb-ne-aaa-prod-csrcr-rg01    rb-ne-aaa-prod-csrvm-as01
                     East US                 rb-eus-aaa-prod-csrcr-rg01   rb-eus-aaa-prod-csrvm-as01

Note. At this time, the Marketplace template for the CSR 1000v does not
allow for putting a CSR 1000v VM in an Availability Set. These resources
are added as a future-proofing exercise.

-   *Virtual Networks.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-vn&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Resource Name Examples
  ------------------ ----------------------- ---------------------------- ------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrcr-rg01     rb-we-aaa-dqa-vn01
                     North Europe            rb-ne-aaa-dqa-csrcr-rg01     rb-ne-aaa-dqa-vn01
                     East US                 rb-eus-aaa-dqa-csrcr-rg01    rb-eus-aaa-dqa-vn01
  AAA - Prod         West Europe             rb-we-aaa-prod-csrcr-rg01    rb-we-aaa-prod-vn01
                     North Europe            rb-ne-aaa-prod-csrcr-rg01    rb-ne-aaa-prod-vn01
                     East US                 rb-eus-aaa-prod-csrcr-rg01   rb-eus-aaa-prod-vn01

-   Subnets.

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-vn&lt;id&gt;-sn&lt;id&gt;**
        (If ER =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-vn&lt;id&gt;-gwsn01**)

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Parent VNET            Resource Name Examples
  ------------------ ----------------------- ---------------------------- ---------------------- -----------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrcr-rg01     rb-we-aaa-dqa-vn01     rb-we-aaa-dqa-vn01-sn01
                                                                                                 rb-we-aaa-dqa-vn01-sn02
                                                                                                 rb-we-aaa-dqa-vn01-sn03
                                                                                                 rb-we-aaa-dqa-vn01-sn04
                                                                                                 rb-we-aaa-dqa-vn01-gwsn01
                     North Europe            rb-ne-aaa-dqa-csrcr-rg01     rb-ne-aaa-dqa-vn01     rb-ne-aaa-dqa-vn01-sn01
                                                                                                 rb-ne-aaa-dqa-vn01-sn02
                                                                                                 rb-ne-aaa-dqa-vn01-sn03
                                                                                                 rb-ne-aaa-dqa-vn01-sn04
                                                                                                 rb-ne-aaa-dqa-vn01-gwsn01
                     East US                 rb-eus-aaa-dqa-csrcr-rg01    rb-eus-aaa-dqa-vn01    rb-eus-aaa-dqa-vn01-sn01
                                                                                                 rb-eus-aaa-dqa-vn01-sn02
                                                                                                 rb-eus-aaa-dqa-vn01-sn03
                                                                                                 rb-eus-aaa-dqa-vn01-sn04
                                                                                                 rb-eus-aaa-dqa-vn01-gwsn01
  AAA - Prod         West Europe             rb-we-aaa-prod-csrcr-rg01    rb-we-aaa-prod-vn01    rb-we-aaa-prod-vn01-sn01
                                                                                                 rb-we-aaa-prod-vn01-sn02
                                                                                                 rb-we-aaa-prod-vn01-sn03
                                                                                                 rb-we-aaa-prod-vn01-sn04
                                                                                                 rb-we-aaa-prod-vn01-gwsn01
                     North Europe            rb-ne-aaa-prod-csrcr-rg01    rb-ne-aaa-prod-vn01    rb-ne-aaa-prod-vn01-sn01
                                                                                                 rb-ne-aaa-prod-vn01-sn02
                                                                                                 rb-ne-aaa-prod-vn01-sn03
                                                                                                 rb-ne-aaa-prod-vn01-sn04
                                                                                                 rb-ne-aaa-prod-vn01-gwsn01
                     East US                 rb-eus-aaa-prod-csrcr-rg01   rb-eus-aaa-prod-vn01   rb-eus-aaa-prod-vn01-sn01
                                                                                                 rb-eus-aaa-prod-vn01-sn02
                                                                                                 rb-eus-aaa-prod-vn01-sn03
                                                                                                 rb-eus-aaa-prod-vn01-sn04
                                                                                                 rb-eus-aaa-prod-vn01-gwsn01

-   *UDRs.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-udrvn&lt;id&gt;sn&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                    Linked Subnet                 Resource Name Examples
  ------------------ ----------------------- ---------------------------- ----------------------------- -------------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrcr-rg01     rb-we-aaa-dqa-vn01-sn01       rb-we-aaa-dqa-udrvn01sn01
                                                                          rb-we-aaa-dqa-vn01-sn02       rb-we-aaa-dqa-udrvn01sn02
                                                                          rb-we-aaa-dqa-vn01-sn03       rb-we-aaa-dqa-udrvn01sn03
                                                                          rb-we-aaa-dqa-vn01-sn04       rb-we-aaa-dqa-udrvn01sn04
                                                                          rb-we-aaa-dqa-vn01-gwsn01     rb-we-aaa-dqa-udrvn01gwsn01
                     North Europe            rb-ne-aaa-dqa-csrcr-rg01     rb-ne-aaa-dqa-vn01-sn01       rb-ne-aaa-dqa-udrvn01sn01
                                                                          rb-ne-aaa-dqa-vn01-sn02       rb-ne-aaa-dqa-udrvn01sn02
                                                                          rb-ne-aaa-dqa-vn01-sn03       rb-ne-aaa-dqa-udrvn01sn03
                                                                          rb-ne-aaa-dqa-vn01-sn04       rb-ne-aaa-dqa-udrvn01sn04
                                                                          rb-ne-aaa-dqa-vn01-gwsn01     rb-ne-aaa-dqa-udrvn01gwsn01
                     East US                 rb-eus-aaa-dqa-csrcr-rg01    rb-eus-aaa-dqa-vn01-sn01      rb-eus-aaa-dqa-udrvn01sn01
                                                                          rb-eus-aaa-dqa-vn01-sn02      rb-eus-aaa-dqa-udrvn01sn02
                                                                          rb-eus-aaa-dqa-vn01-sn03      rb-eus-aaa-dqa-udrvn01sn03
                                                                          rb-eus-aaa-dqa-vn01-sn04      rb-eus-aaa-dqa-udrvn01sn04
                                                                          rb-eus-aaa-dqa-vn01-gwsn01    rb-eus-aaa-dqa-udrvn01gwsn01
  AAA - Prod         West Europe             rb-we-aaa-prod-csrcr-rg01    rb-we-aaa-prod-vn01-sn01      rb-we-aaa-prod-udrvn01sn01
                                                                          rb-we-aaa-prod-vn01-sn02      rb-we-aaa-prod-udrvn01sn02
                                                                          rb-we-aaa-prod-vn01-sn03      rb-we-aaa-prod-udrvn01sn03
                                                                          rb-we-aaa-prod-vn01-sn04      rb-we-aaa-prod-udrvn01sn04
                                                                          rb-we-aaa-prod-vn01-gwsn01    rb-we-aaa-prod-udrvn01gwsn01
                     North Europe            rb-ne-aaa-prod-csrcr-rg01    rb-ne-aaa-prod-vn01-sn01      rb-ne-aaa-prod-udrvn01sn01
                                                                          rb-ne-aaa-prod-vn01-sn02      rb-ne-aaa-prod-udrvn01sn02
                                                                          rb-ne-aaa-prod-vn01-sn03      rb-ne-aaa-prod-udrvn01sn03
                                                                          rb-ne-aaa-prod-vn01-sn04      rb-ne-aaa-prod-udrvn01sn04
                                                                          rb-ne-aaa-prod-vn01-gwsn01    rb-ne-aaa-prod-udrvn01gwsn01
                     East US                 rb-eus-aaa-prod-csrcr-rg01   rb-eus-aaa-prod-vn01-sn01     rb-eus-aaa-prod-udrvn01sn01
                                                                          rb-eus-aaa-prod-vn01-sn02     rb-eus-aaa-prod-udrvn01sn02
                                                                          rb-eus-aaa-prod-vn01-sn03     rb-eus-aaa-prod-udrvn01sn03
                                                                          rb-eus-aaa-prod-vn01-sn04     rb-eus-aaa-prod-udrvn01sn04
                                                                          rb-eus-aaa-prod-vn01-gwsn01   rb-eus-aaa-prod-udrvn01gwsn01

-   *CSR 1000v VMs.*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-csrvm&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Parent RG                     Resource Name Examples
  ------------------ ----------------------- ----------------------------- --------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrvm-rg101     rb-we-aaa-dqa-csrvm101
                                             rb-we-aaa-dqa-csrvm-rg102     rb-we-aaa-dqa-csrvm102
                     North Europe            rb-ne-aaa-dqa-csrvm-rg101     rb-ne-aaa-dqa-csrvm101
                                             rb-ne-aaa-dqa-csrvm-rg102     rb-ne-aaa-dqa-csrvm102
                     East US                 rb-eus-aaa-dqa-csrvm-rg101    rb-eus-aaa-dqa-csrvm101
                                             rb-eus-aaa-dqa-csrvm-rg102    rb-eus-aaa-dqa-csrvm102
  AAA - Prod         West Europe             rb-we-aaa-prod-csrvm-rg101    rb-we-aaa-prod-csrvm101
                                             rb-we-aaa-prod-csrvm-rg102    rb-we-aaa-prod-csrvm102
                     North Europe            rb-ne-aaa-prod-csrvm-rg101    rb-ne-aaa-prod-csrvm101
                                             rb-ne-aaa-prod-csrvm-rg102    rb-ne-aaa-prod-csrvm102
                     East US                 rb-eus-aaa-prod-csrvm-rg101   rb-eus-aaa-prod-csrvm101
                                             rb-eus-aaa-prod-csrvm-rg102   rb-eus-aaa-prod-csrvm102

-   *CSR VM NIC (4 NIC SKU).*

    -   Naming Standard =
        **&lt;orgprefix&gt;&lt;regioncode&gt;&lt;service&gt;-&lt;stage&gt;-csrvm&lt;id&gt;-nic&lt;id&gt;**

  Service/App Zone   Azure Region (‘Site’)   Associated CSR 1000v VM       Resource Name Examples
  ------------------ ----------------------- ----------------------------- ----------------------------------------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrvm-rg101     rb-we-aaa-dqa-csrvm101-nic01
                                                                           rb-we-aaa-dqa-csrvm101-nic02
                                                                           rb-we-aaa-dqa-csrvm101-nic03
                                                                           rb-we-aaa-dqa-csrvm101-nic04
                                             rb-we-aaa-dqa-csrvm-rg102     rb-we-aaa-dqa-csrvm102-nic01
                                                                           rb-we-aaa-dqa-csrvm102-nic02
                                                                           rb-we-aaa-dqa-csrvm102-nic03
                                                                           rb-we-aaa-dqa-csrvm102-nic04
                     North Europe            rb-ne-aaa-dqa-csrvm-rg101     rb-ne-aaa-dqa-csrvm101-nic01
                                                                           rb-ne-aaa-dqa-csrvm101-nic02
                                                                           rb-ne-aaa-dqa-csrvm101-nic03
                                                                           rb-ne-aaa-dqa-csrvm101-nic04
                                             rb-ne-aaa-dqa-csrvm-rg102     rb-ne-aaa-dqa-csrvm102-nic01
                                                                           rb-ne-aaa-dqa-csrvm102-nic01
                                                                           rb-ne-aaa-dqa-csrvm102-nic01
                                                                           rb-ne-aaa-dqa-csrvm102-nic01
                     East US                 rb-eus-aaa-dqa-csrvm-rg101    rb-eus-aaa-dqa-csrvm101-nic01
                                                                           rb-eus-aaa-dqa-csrvm101-nic02
                                                                           rb-eus-aaa-dqa-csrvm101-nic03
                                                                           rb-eus-aaa-dqa-csrvm101-nic04
                                             rb-eus-aaa-dqa-csrvm-rg102    rb-eus-aaa-dqa-csrvm102-nic01
                                                                           rb-eus-aaa-dqa-csrvm102-nic02
                                                                           rb-eus-aaa-dqa-csrvm102-nic03
                                                                           rb-eus-aaa-dqa-csrvm102-nic04
  AAA - Prod         West Europe             rb-we-aaa-prod-csrvm-rg101    rb-we-aaa-prod-csrvm101-nic01
                                                                           rb-we-aaa-prod-csrvm101-nic02
                                                                           rb-we-aaa-prod-csrvm101-nic03
                                                                           rb-we-aaa-prod-csrvm101-nic04
                                             rb-we-aaa-prod-csrvm-rg102    rb-we-aaa-prod-csrvm102-nic01
                                                                           rb-we-aaa-prod-csrvm102-nic02
                                                                           rb-we-aaa-prod-csrvm102-nic03
                                                                           rb-we-aaa-prod-csrvm102-nic04
                     North Europe            rb-ne-aaa-prod-csrvm-rg101    rb-ne-aaa-prod-csrvm101-nic01
                                                                           rb-ne-aaa-prod-csrvm101-nic02
                                                                           rb-ne-aaa-prod-csrvm101-nic03
                                                                           rb-ne-aaa-prod-csrvm101-nic04
                                             rb-ne-aaa-prod-csrvm-rg102    rb-ne-aaa-prod-csrvm102-nic01
                                                                           rb-ne-aaa-prod-csrvm102-nic02
                                                                           rb-ne-aaa-prod-csrvm102-nic03
                                                                           rb-ne-aaa-prod-csrvm102-nic04
                     East US                 rb-eus-aaa-prod-csrvm-rg101   rb-eus-aaa-prod-csrvm101-nic01
                                                                           rb-eus-aaa-prod-csrvm101-nic02
                                                                           rb-eus-aaa-prod-csrvm101-nic03
                                                                           rb-eus-aaa-prod-csrvm101-nic04
                                             rb-eus-aaa-prod-csrvm-rg102   []{#_Hlk495572058 .anchor}rb-eus-aaa-prod-csrvm102-nic01
                                                                           rb-eus-aaa-prod-csrvm102-nic02
                                                                           rb-eus-aaa-prod-csrvm102-nic03
                                                                           rb-eus-aaa-prod-csrvm102-nic04

***The approach above allows for:***

-   Deployment of new CSR VMs into new RGs.

    -   i.e. In cases of:

        -   Replacement of CSR VMs for IOS-XE upgrades.

        -   Replacement of CSR VMs post-failure.

-   Common Resources remaining in place with newly created,
    unwanted/unneeded resources being easily to identify and then,
    subsequently, being removed (these resources are auto-created each
    time that a CSR 1000v is deployed - e.g. UDRs).

-   RGs mapped to resource lifecycles.

#### **We also required IP address space allocation is needed that allows for:**

1.  4 x Azure Subnets per-site/region, per-stage.

    a.  24 in total = 8 per-site = 4 in ‘DevQA’ VNet and 4 in ‘Prod’
        VNet.

    b.  CSR VMs and Test VMs have NICs attached to these Subnets.

2.  1 x Inter-site/region tunnel subnet, per-stage.

    a.  2 in total.

        i.  1 per-stage across all sites/regions.

    b.  These subnets are not configured/seen in Azure - they are in an
        abstracted and non-routable namespace.

    c.  Each router has a single mGRE tunnel interface configured with
        an IP address in one of these 2 subnets.

        i.  DMVPN leverages these tunnels.

3.  1 x Intra-site/region tunnel subnets, per-stage.

    a.  6 in total.

        i.  1 per-HA router pair.

            1.  2 x HA router pairs per-site/region (1 x HA pair
                per-stage).

    b.  These subnets are not configured in Azure - they are in an
        abstracted and non-routable namespace.

    c.  VXLAN GPE tunnel interfaces are configured with IP addresses
        these subnets.

        i.  Failure-detection leverages these intra-site/region tunnels.

4.  2 x /30 Loopback interface subnets per-router.

    a.  12 in total = 4 per-site/region = 2 per-stage.

        i.  1 x Loopback interface per-router resides in the default
            VRF.

        ii. 1 x Loopback interface per-router resides in a ‘PROD’ VRF.

#### ***An example and what we’ll be using:***

-   *Azure Subnets*

  ---------------------------------------------------------------------------------------------------------------------
  Service/App Zone   Azure Region (‘Site’)   Parent VNET            Resource Name               Subnet Address Prefix
  ------------------ ----------------------- ---------------------- --------------------------- -----------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-vn01     rb-we-aaa-dqa-vn01-sn01     192.168.0.0/24
                                                                                                
                                             192.168.0.0/20                                     

                                                                    rb-we-aaa-dqa-vn01-sn02     192.168.1.0/24

                                                                    rb-we-aaa-dqa-vn01-sn03     192/168.2.0/24

                                                                    rb-we-aaa-dqa-vn01-sn04     192.168.3.0/24

                     North Europe            rb-ne-aaa-dqa-vn01     rb-ne-aaa-dqa-vn01-sn01     192.168.16.0/24
                                                                                                
                                             192.168.16.0/20                                    

                                                                    rb-ne-aaa-dqa-vn01-sn02     192.168.17.0/24

                                                                    rb-ne-aaa-dqa-vn01-sn03     192/168.18.0/24

                                                                    rb-ne-aaa-dqa-vn01-sn04     192.168.19.0/24

                     East US                 rb-eus-aaa-dqa-vn01    rb-eus-aaa-dqa-vn01-sn01    192.168.32.0/24
                                                                                                
                                             192.168.32.0/20                                    

                                                                    rb-eus-aaa-dqa-vn01-sn02    192.168.33.0/24

                                                                    rb-eus-aaa-dqa-vn01-sn03    192/168.34.0/24

                                                                    rb-eus-aaa-dqa-vn01-sn04    192.168.35.0/24

  AAA - Prod         West Europe             rb-we-aaa-prod-vn01    rb-we-aaa-prod-vn01-sn01    192.168.112.0/24
                                                                                                
                                             192.168.112.0/20                                   

                                                                    rb-we-aaa-prod-vn01-sn02    192.168.113.0/24

                                                                    rb-we-aaa-prod-vn01-sn03    192/168.114.0/24

                                                                    rb-we-aaa-prod-vn01-sn04    192.168.115.0/24

                     North Europe            rb-ne-aaa-prod-vn01    rb-ne-aaa-prod-vn01-sn01    192.168.128.0/24
                                                                                                
                                             192.168.128.0/20                                   

                                                                    rb-ne-aaa-prod-vn01-sn02    192.168.129.0/24

                                                                    rb-ne-aaa-prod-vn01-sn03    192/168.130.0/24

                                                                    rb-ne-aaa-prod-vn01-sn04    192.168.131.0/24

                     East US                 rb-eus-aaa-prod-vn01   rb-eus-aaa-prod-vn01-sn01   192.168.144.0/24
                                                                                                
                                             192.168.144.0/20                                   

                                                                    rb-eus-aaa-prod-vn01-sn02   192.168.145.0/24

                                                                    rb-eus-aaa-prod-vn01-sn03   192/168.146.0/24

                                                                    rb-eus-aaa-prod-vn01-sn04   192.168.147.0/24
  ---------------------------------------------------------------------------------------------------------------------

-   *Inter-site/Region mGRE Tunnel Subnets (DMVPN)*

  Service/App Zone   Subnet Address Prefix
  ------------------ -----------------------
  AAA - Dev and QA   172.16.0.0/24
  AAA – Prod         172.16.10.0/24

-   *Intra-site/Region VXLAN Tunnel Subnets (BFD)*

  Service/App Zone   Azure Region (‘Site’)   Subnet Address Prefix
  ------------------ ----------------------- -----------------------
  AAA - Dev and QA   West Europe             172.16.100.0/24
                     North Europe            172.16.110.0/24
                     East US                 172.16.120.0/24
  AAA – Prod         West Europe             172.16.150.0/24
                     North Europe            172.16.160.0/24
                     East US                 172.16.170.0/24

-   *Loopback Interface Subnets (Always-up source/destination
    interface)*

  ----------------------------------------------------------------------------------------------------
  Service/App Zone   Azure Region (‘Site’)   Router Name                Loopback Interface IP Subnet
  ------------------ ----------------------- -------------------------- ------------------------------
  AAA - Dev and QA   West Europe             rb-we-aaa-dqa-csrvm101     1.1.1.0/30
                                                                        
  (VRF = default)                                                       

                                             rb-we-aaa-dqa-csrvm102     1.1.1.4/30

                     North Europe            rb-ne-aaa-dqa-csrvm101     1.1.1.0/30

                                             rb-ne-aaa-dqa-csrvm102     1.1.1.4/30

                     East US                 rb-eus-aaa-dqa-csrvm101    1.1.1.0/30

                                             rb-eus-aaa-dqa-csrvm102    1.1.1.4/30

  AAA – Prod         West Europe             rb-we-aaa-prod-csrvm101    172.16.151.0/30
                                                                        
  (VRF = ‘PROD’)                                                        

                                             rb-we-aaa-prod-csrvm102    172.16.151.4/30

                     North Europe            rb-ne-aaa-prod-csrvm101    172.16.161.0/30

                                             rb-ne-aaa-prod-csrvm102    172.16.161.4/30

                     East US                 rb-eus-aaa-prod-csrvm101   172.16.171.0/30

                                             rb-eus-aaa-prod-csrvm102   172.16.171.4/30
  ----------------------------------------------------------------------------------------------------

#### ***Azure Deployment:***

#### **Resource Groups**

Command line

az group create --name rb-we-aaa-dqa-sdisk-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-sdisk-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-sdisk-rg01 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-sdisk-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-sdisk-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-sdisk-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-sdiag-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-sdiag-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-sdiag-rg01 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-sdiag-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-sdiag-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-sdiag-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-pipm-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-pipm-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-pipm-rg01 --location eastus --tags
App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-pipm-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-pipm-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-pipm-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-pipd-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-pipd-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-pipd-rg01 --location eastus --tags
App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-pipd-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-pipd-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-pipd-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-tstvm-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-tstvm-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-tstvm-rg01 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-tstvm-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-tstvm-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-tstvm-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-csrcr-rg01 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-csrcr-rg01 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-csrcr-rg01 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-csrcr-rg01 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-csrcr-rg01 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-csrcr-rg01 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-dqa-csrvm-rg101 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-dqa-csrvm-rg102 --location westeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-csrvm-rg101 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-ne-aaa-dqa-csrvm-rg102 --location northeurope
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-csrvm-rg101 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-eus-aaa-dqa-csrvm-rg102 --location eastus
--tags App=AAA Stage=DevQA

az group create --name rb-we-aaa-prod-csrvm-rg101 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-we-aaa-prod-csrvm-rg102 --location westeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-csrvm-rg101 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-ne-aaa-prod-csrvm-rg102 --location northeurope
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-csrvm-rg101 --location eastus
--tags App=AAA Stage=Prod

az group create --name rb-eus-aaa-prod-csrvm-rg102 --location eastus
--tags App=AAA Stage=Prod

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-sdisk-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-sdisk-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-sdisk-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-sdisk-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-sdisk-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-sdisk-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-sdiag-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-sdiag-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-sdiag-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-sdiag-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-sdiag-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-sdiag-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-pipm-rg01 -Location \$Site1
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-pipm-rg01 -Location \$Site2
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-pipm-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-pipm-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-pipm-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-pipm-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-pipd-rg01 -Location \$Site1
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-pipd-rg01 -Location \$Site2
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-pipd-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-pipd-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-pipd-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-pipd-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-tstvm-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-tstvm-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-tstvm-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-tstvm-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-tstvm-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-tstvm-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-csrcr-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-csrcr-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-csrcr-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-csrcr-rg01 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-csrcr-rg01 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-csrcr-rg01 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-csrvm-rg101 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-dqa-csrvm-rg102 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-csrvm-rg101 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-ne-aaa-dqa-csrvm-rg102 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-csrvm-rg101 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-eus-aaa-dqa-csrvm-rg102 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-csrvm-rg101 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-we-aaa-prod-csrvm-rg102 -Location
\$Site1 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-csrvm-rg101 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-ne-aaa-prod-csrvm-rg102 -Location
\$Site2 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-csrvm-rg101 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmResourceGroup -Name rb-eus-aaa-prod-csrvm-rg102 -Location
\$Site3 -Tag @{ App="\$App"; Stage="\$Stage2" }

#### **Storage Accounts**

Command line

az storage account create --resource-group rb-we-aaa-dqa-sdisk-rg01
--location westeurope --namerbweaaadqasadisk001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-ne-aaa-dqa-sdisk-rg01
--location northeurope --namerbneaaadqasadisk001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-eus-aaa-dqa-sdisk-rg01
--location eastus --namerbeusaaadqasadisk001 --sku Standard\_LRS --kind
Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-we-aaa-prod-sdisk-rg01
--location westeurope --namerbweaaaprodsadisk001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=Prod

az storage account create --resource-group rb-ne-aaa-prod-sdisk-rg01
--location northeurope --namerbneaaaprodsadisk001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=Prod

az storage account create --resource-group rb-eus-aaa-prod-sdisk-rg01
--location eastus --namerbeusaaaprodsadisk001 --sku Standard\_LRS --kind
Storage --tags App=AAA Stage=Prod

az storage account create --resource-group rb-we-aaa-dqa-sdiag-rg01
--location westeurope --namerbweaaadqasadiag001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-ne-aaa-dqa-sdiag-rg01
--location northeurope --namerbneaaadqasadiag001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-eus-aaa-dqa-sdiag-rg01
--location eastus --namerbeusaaadqasadiag001 --sku Standard\_LRS --kind
Storage --tags App=AAA Stage=DevQA

az storage account create --resource-group rb-we-aaa-prod-sdiag-rg01
--location westeurope --namerbweaaaprodsadiag001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=Prod

az storage account create --resource-group rb-ne-aaa-prod-sdiag-rg01
--location northeurope --namerbneaaaprodsadiag001 --sku Standard\_LRS
--kind Storage --tags App=AAA Stage=Prod

az storage account create --resource-group rb-eus-aaa-prod-sdiag-rg01
--location eastus --namerbeusaaaprodsadiag001 --sku Standard\_LRS --kind
Storage --tags App=AAA Stage=Prod

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

New-AzureRmStorageAccount -ResourceGroupName rb-we-aaa-dqa-sdisk-rg01
-Location \$Site1 -AccountName rbweaaadqasadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-ne-aaa-dqa-sdisk-rg01
-Location \$Site2 -AccountName rbneaaadqasadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-eus-aaa-dqa-sdisk-rg01
-Location \$Site3 -AccountName rbeusaaadqasadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-we-aaa-prod-sdisk-rg01
-Location \$Site1 -AccountName rbweaaaprodsadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-ne-aaa-prod-sdisk-rg01
-Location \$Site2 -AccountName rbneaaaprodsadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-eus-aaa-prod-sdisk-rg01
-Location \$Site3 -AccountName rbeusaaaprodsadisk001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-we-aaa-dqa-sdiag-rg01
-Location \$Site1 -AccountName rbweaaadqasadiag001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-ne-aaa-dqa-sdiag-rg01
-Location \$Site2 -AccountName rbneaaadqasadiag001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-eus-aaa-dqa-sdiag-rg01
-Location \$Site3 -AccountName rbeusaaadqasadiag001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-we-aaa-prod-sdiag-rg01
-Location \$Site1 -AccountName rbweaaaprodsadiag001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-ne-aaa-prod-sdiag-rg01
-Location \$Site2 -AccountName rbneaaaprodsadiag001 -SkuName
"Standard\_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-eus-aaa-prod-sdiag-rg01
-Location \$Site3 -AccountName rbeusaaaprodsadiag001 -SkuName
"Standard\_LRS"

#### **Virtual Networks and Subnets**

Command line

az network vnet create --name rb-we-aaa-dqa-vn01 --resource-group
rb-we-aaa-dqa-csrcr-rg01 --location westeurope --address-prefix
192.168.0.0/20 --tags App=AAA Stage=DevQA

az network vnet subnet create --address-prefix 192.168.0.0/24 --name
rb-we-aaa-dqa-vn01-sn01 --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.1.0/24 --name
rb-we-aaa-dqa-vn01-sn02 --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.2.0/24 --name
rb-we-aaa-dqa-vn01-sn03 --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.3.0/24 --name
rb-we-aaa-dqa-vn01-sn04 --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01

az network vnet create --name rb-ne-aaa-dqa-vn01 --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --location northeurope --address-prefix
192.168.16.0/20 --tags App=AAA Stage=DevQA

az network vnet subnet create --address-prefix 192.168.16.0/24 --name
rb-ne-aaa-dqa-vn01-sn01 --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.17.0/24 --name
rb-ne-aaa-dqa-vn01-sn02 --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.18.0/24 --name
rb-ne-aaa-dqa-vn01-sn03 --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.19.0/24 --name
rb-ne-aaa-dqa-vn01-sn04 --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01

az network vnet create --name rb-eus-aaa-dqa-vn01 --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --location eastus --address-prefix
192.168.32.0/20 --tags App=AAA Stage=DevQA

az network vnet subnet create --address-prefix 192.168.32.0/24 --name
rb-eus-aaa-dqa-vn01-sn01 --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.33.0/24 --name
rb-eus-aaa-dqa-vn01-sn02 --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.34.0/24 --name
rb-eus-aaa-dqa-vn01-sn03 --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01

az network vnet subnet create --address-prefix 192.168.35.0/24 --name
rb-eus-aaa-dqa-vn01-sn04 --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01

az network vnet create --name rb-we-aaa-prod-vn01 --resource-group
rb-we-aaa-prod-csrcr-rg01 --location westeurope --address-prefix
192.168.112.0/20 --tags App=AAA Stage=Prod

az network vnet subnet create --address-prefix 192.168.112.0/24 --name
rb-we-aaa-prod-vn01-sn01 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.113.0/24 --name
rb-we-aaa-prod-vn01-sn02 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.114.0/24 --name
rb-we-aaa-prod-vn01-sn03 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.115.0/24 --name
rb-we-aaa-prod-vn01-sn04 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet create --name rb-ne-aaa-prod-vn01 --resource-group
rb-ne-aaa-prod-csrcr-rg01 --location northeurope --address-prefix
192.168.128.0/20 --tags App=AAA Stage=Prod

az network vnet subnet create --address-prefix 192.168.112.0/24 --name
rb-we-aaa-prod-vn01-sn01 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.113.0/24 --name
rb-we-aaa-prod-vn01-sn02 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.114.0/24 --name
rb-we-aaa-prod-vn01-sn03 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.115.0/24 --name
rb-we-aaa-prod-vn01-sn04 --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01

az network vnet create --name rb-eus-aaa-prod-vn01 --resource-group
rb-eus-aaa-prod-csrcr-rg01 --location eastus --address-prefix
192.168.144.0/20 --tags App=AAA Stage=Prod

az network vnet subnet create --address-prefix 192.168.144.0/24 --name
rb-eus-aaa-prod-vn01-sn01 --resource-group rb-eus-aaa-prod-csrcr-rg01
--vnet-name rb-eus-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.145.0/24 --name
rb-eus-aaa-prod-vn01-sn02 --resource-group rb-eus-aaa-prod-csrcr-rg01
--vnet-name rb-eus-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.146.0/24 --name
rb-eus-aaa-prod-vn01-sn03 --resource-group rb-eus-aaa-prod-csrcr-rg01
--vnet-name rb-eus-aaa-prod-vn01

az network vnet subnet create --address-prefix 192.168.147.0/24 --name
rb-eus-aaa-prod-vn01-sn04 --resource-group rb-eus-aaa-prod-csrcr-rg01
--vnet-name rb-eus-aaa-prod-vn01

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

\$Site1Stage1CRRG = "rb-we-aaa-dqa-csrcr-rg01"

\$Site2Stage1CRRG = "rb-ne-aaa-dqa-csrcr-rg01"

\$Site3Stage1CRRG = "rb-eus-aaa-dqa-csrcr-rg01"

\$Site1Stage2CRRG = "rb-we-aaa-prod-csrcr-rg01"

\$Site2Stage2CRRG = "rb-ne-aaa-prod-csrcr-rg01"

\$Site3Stage2CRRG = "rb-eus-aaa-prod-csrcr-rg01"

\$Site1Stage1VNETName = "rb-we-aaa-dqa-vn01"

\$Site2Stage1VNETName = "rb-ne-aaa-dqa-vn01"

\$Site3Stage1VNETName = "rb-eus-aaa-dqa-vn01"

\$Site1Stage2VNETName = "rb-we-aaa-prod-vn01"

\$Site2Stage2VNETName = "rb-ne-aaa-prod-vn01"

\$Site3Stage2VNETName = "rb-eus-aaa-prod-vn01"

\$Site1Stage1AddressPrefix = "192.168.0.0/20"

\$Site2Stage1AddressPrefix = "192.168.16.0/20"

\$Site3Stage1AddressPrefix = "192.168.32.0/20"

\$Site1Stage2AddressPrefix = "192.168.112.0/20"

\$Site2Stage2AddressPrefix = "192.168.128.0/20"

\$Site3Stage2AddressPrefix = "192.168.144.0/20"

\$Site1Stage1MgmtSubnetName = "rb-we-aaa-dqa-vn01-sn01"

\$Site1Stage1OutsideSubnetName = "rb-we-aaa-dqa-vn01-sn02"

\$Site1Stage1DMZSubnetName = "rb-we-aaa-dqa-vn01-sn03"

\$Site1Stage1InsideSubnetName = "rb-we-aaa-dqa-vn01-sn04"

\$Site1Stage2MgmtSubnetName = "rb-we-aaa-prod-vn01-sn01"

\$Site1Stage2OutsideSubnetName = "rb-we-aaa-prod-vn01-sn02"

\$Site1Stage2DMZSubnetName = "rb-we-aaa-prod-vn01-sn03"

\$Site1Stage2InsideSubnetName = "rb-we-aaa-prod-vn01-sn04"

\$Site2Stage1MgmtSubnetName = "rb-ne-aaa-dqa-vn01-sn01"

\$Site2Stage1OutsideSubnetName = "rb-ne-aaa-dqa-vn01-sn02"

\$Site2Stage1DMZSubnetName = "rb-ne-aaa-dqa-vn01-sn03"

\$Site2Stage1InsideSubnetName = "rb-ne-aaa-dqa-vn01-sn04"

\$Site2Stage2MgmtSubnetName = "rb-ne-aaa-prod-vn01-sn01"

\$Site2Stage2OutsideSubnetName = "rb-ne-aaa-prod-vn01-sn02"

\$Site2Stage2DMZSubnetName = "rb-ne-aaa-prod-vn01-sn03"

\$Site2Stage2InsideSubnetName = "rb-ne-aaa-prod-vn01-sn04"

\$Site3Stage1MgmtSubnetName = "rb-eus-aaa-dqa-vn01-sn01"

\$Site3Stage1OutsideSubnetName = "rb-eus-aaa-dqa-vn01-sn02"

\$Site3Stage1DMZSubnetName = "rb-eus-aaa-dqa-vn01-sn03"

\$Site3Stage1InsideSubnetName = "rb-eus-aaa-dqa-vn01-sn04"

\$Site3Stage2MgmtSubnetName = "rb-eus-aaa-prod-vn01-sn01"

\$Site3Stage2OutsideSubnetName = "rb-eus-aaa-prod-vn01-sn02"

\$Site3Stage2DMZSubnetName = "rb-eus-aaa-prod-vn01-s03"

\$Site3Stage2InsideSubnetName = "rb-eus-aaa-prod-vn01-sn04"

\$Site1Stage1MgmtSubnetPrefix = "192.168.0.0/24"

\$Site1Stage1OutsideSubnetPrefix = "192.168.1.0/24"

\$Site1Stage1DMZSubnetPrefix = "192.168.2.0/24"

\$Site1Stage1InsideSubnetPrefix = "192.168.3.0/24"

\$Site1Stage2MgmtSubnetPrefix = "192.168.112.0/24"

\$Site1Stage2OutsideSubnetPrefix = "192.168.113.0/24"

\$Site1Stage2DMZSubnetPrefix = "192.168.114.0/24"

\$Site1Stage2InsideSubnetPrefix = "192.168.115.0/24"

\$Site2Stage1MgmtSubnetPrefix = "192.168.16.0/24"

\$Site2Stage1OutsideSubnetPrefix = "192.168.17.0/24"

\$Site2Stage1DMZSubnetPrefix = "192.168.18.0/24"

\$Site2Stage1InsideSubnetPrefix = "192.168.19.0/24"

\$Site2Stage2MgmtSubnetPrefix = "192.168.128.0/24"

\$Site2Stage2OutsideSubnetPrefix = "192.168.129.0/24"

\$Site2Stage2DMZSubnetPrefix = "192.168.130.0/24"

\$Site2Stage2InsideSubnetPrefix = "192.168.131.0/24"

\$Site3Stage1MgmtSubnetPrefix = "192.168.32.0/24"

\$Site3Stage1OutsideSubnetPrefix = "192.168.33.0/24"

\$Site3Stage1DMZSubnetPrefix = "192.168.34.0/24"

\$Site3Stage1InsideSubnetPrefix = "192.168.35.0/24"

\$Site3Stage2MgmtSubnetPrefix = "192.168.144.0/24"

\$Site3Stage2OutsideSubnetPrefix = "192.168.145.0/24"

\$Site3Stage2DMZSubnetPrefix = "192.168.146.0/24"

\$Site3Stage2InsideSubnetPrefix = "192.168.147.0/24"

\$Site1Stage1MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage1MgmtSubnetName" -AddressPrefix
"\$Site1Stage1MgmtSubnetPrefix"

\$Site1Stage1OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage1OutsideSubnetName" -AddressPrefix
"\$Site1Stage1OutsideSubnetPrefix"

\$Site1Stage1DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage1DMZSubnetName" -AddressPrefix
"\$Site1Stage1DMZSubnetPrefix"

\$Site1Stage1InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage1InsideSubnetName" -AddressPrefix
"\$Site1Stage1InsideSubnetPrefix"

\$Site1Stage2MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage2MgmtSubnetName" -AddressPrefix
"\$Site1Stage2MgmtSubnetPrefix"

\$Site1Stage2OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage2OutsideSubnetName" -AddressPrefix
"\$Site1Stage2OutsideSubnetPrefix"

\$Site1Stage2DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage2DMZSubnetName" -AddressPrefix
"\$Site1Stage2DMZSubnetPrefix"

\$Site1Stage2InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site1Stage2InsideSubnetName" -AddressPrefix
"\$Site1Stage2InsideSubnetPrefix"

\$Site2Stage1MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage1MgmtSubnetName" -AddressPrefix
"\$Site2Stage1MgmtSubnetPrefix"

\$Site2Stage1OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage1OutsideSubnetName" -AddressPrefix
"\$Site2Stage1OutsideSubnetPrefix"

\$Site2Stage1DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage1DMZSubnetName" -AddressPrefix
"\$Site2Stage1DMZSubnetPrefix"

\$Site2Stage1InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage1InsideSubnetName" -AddressPrefix
"\$Site2Stage1InsideSubnetPrefix"

\$Site2Stage2MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage2MgmtSubnetName" -AddressPrefix
"\$Site2Stage2MgmtSubnetPrefix"

\$Site2Stage2OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage2OutsideSubnetName" -AddressPrefix
"\$Site2Stage2OutsideSubnetPrefix"

\$Site2Stage2DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage2DMZSubnetName" -AddressPrefix
"\$Site2Stage2DMZSubnetPrefix"

\$Site2Stage2InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site2Stage2InsideSubnetName" -AddressPrefix
"\$Site2Stage2InsideSubnetPrefix"

\$Site3Stage1MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage1MgmtSubnetName" -AddressPrefix
"\$Site3Stage1MgmtSubnetPrefix"

\$Site3Stage1OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage1OutsideSubnetName" -AddressPrefix
"\$Site3Stage1OutsideSubnetPrefix"

\$Site3Stage1DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage1DMZSubnetName" -AddressPrefix
"\$Site3Stage1DMZSubnetPrefix"

\$Site3Stage1InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage1InsideSubnetName" -AddressPrefix
"\$Site3Stage1InsideSubnetPrefix"

\$Site3Stage2MgmtSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage2MgmtSubnetName" -AddressPrefix
"\$Site3Stage2MgmtSubnetPrefix"

\$Site3Stage2OutsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage2OutsideSubnetName" -AddressPrefix
"\$Site3Stage2OutsideSubnetPrefix"

\$Site3Stage2DMZSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage2DMZSubnetName" -AddressPrefix
"\$Site3Stage2DMZSubnetPrefix"

\$Site3Stage2InsideSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name
"\$Site3Stage2InsideSubnetName" -AddressPrefix
"\$Site3Stage2InsideSubnetPrefix"

New-AzureRmVirtualNetwork -Name \$Site1Stage1VNETName -ResourceGroupName
\$Site1Stage1CRRG -Location \$Site1 -AddressPrefix
\$Site1Stage1AddressPrefix -Subnet
\$Site1Stage1MgmtSubnet,\$Site1Stage1OutsideSubnet,\$Site1Stage1DMZSubnet,\$Site1Stage1InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmVirtualNetwork -Name \$Site1Stage2VNETName -ResourceGroupName
\$Site1Stage2CRRG -Location \$Site1 -AddressPrefix
\$Site1Stage2AddressPrefix -Subnet
\$Site1Stage2MgmtSubnet,\$Site1Stage2OutsideSubnet,\$Site1Stage2DMZSubnet,\$Site1Stage2InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmVirtualNetwork -Name \$Site2Stage1VNETName -ResourceGroupName
\$Site2Stage1CRRG -Location \$Site2 -AddressPrefix
\$Site2Stage1AddressPrefix -Subnet
\$Site2Stage1MgmtSubnet,\$Site2Stage1OutsideSubnet,\$Site2Stage1DMZSubnet,\$Site2Stage1InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmVirtualNetwork -Name \$Site2Stage2VNETName -ResourceGroupName
\$Site2Stage2CRRG -Location \$Site2 -AddressPrefix
\$Site2Stage2AddressPrefix -Subnet
\$Site2Stage2MgmtSubnet,\$Site2Stage2OutsideSubnet,\$Site2Stage2DMZSubnet,\$Site2Stage2InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage2" }

New-AzureRmVirtualNetwork -Name \$Site3Stage1VNETName -ResourceGroupName
\$Site3Stage1CRRG -Location \$Site3 -AddressPrefix
\$Site3Stage1AddressPrefix -Subnet
\$Site3Stage1MgmtSubnet,\$Site3Stage1OutsideSubnet,\$Site3Stage1DMZSubnet,\$Site3Stage1InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage1" }

New-AzureRmVirtualNetwork -Name \$Site3Stage2VNETName -ResourceGroupName
\$Site3Stage2CRRG -Location \$Site3 -AddressPrefix
\$Site3Stage2AddressPrefix -Subnet
\$Site3Stage2MgmtSubnet,\$Site3Stage2OutsideSubnet,\$Site3Stage2DMZSubnet,\$Site3Stage2InsideSubnet
-Tag @{ App="\$App"; Stage="\$Stage2" }

#### **UDRs**

Command line

az network vnet route-table create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --location westeurope --name
rb-we-aaa-dqa-udrvn01sn01 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-we-aaa-dqa-udrvn01sn01 --address-prefix 192.168.1.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-we-aaa-dqa-udrvn01sn01 --address-prefix 192.168.2.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-we-aaa-dqa-udrvn01sn01 --address-prefix 192.168.3.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --location westeurope --name
rb-we-aaa-dqa-udrvn01sn02 --tags App=AAA Stage=DevQA

az network vnet route-table create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --location westeurope --name
rb-we-aaa-dqa-udrvn01sn03 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-we-aaa-dqa-udrvn01sn03 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.2.4

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi3 --route-table-name
rb-we-aaa-dqa-udrvn01sn03 --address-prefix 192.168.1.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.2.4

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi3 --route-table-name
rb-we-aaa-dqa-udrvn01sn03 --address-prefix 192.168.3.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.2.4

az network vnet route-table create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --location westeurope --name
rb-we-aaa-dqa-udrvn01sn04 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-we-aaa-dqa-udrvn01sn04 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.3.4

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi4 --route-table-name
rb-we-aaa-dqa-udrvn01sn04 --address-prefix 192.168.1.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.3.4

az network route-table route create --resource-group
rb-we-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi4 --route-table-name
rb-we-aaa-dqa-udrvn01sn04 --address-prefix 192.168.2.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.3.4

az network vnet route-table create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --location northeurope --name
rb-ne-aaa-dqa-udrvn01sn01 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-ne-aaa-dqa-udrvn01sn01 --address-prefix 192.168.17.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-ne-aaa-dqa-udrvn01sn01 --address-prefix 192.168.18.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-ne-aaa-dqa-udrvn01sn01 --address-prefix 192.168.19.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --location northeurope --name
rb-ne-aaa-dqa-udrvn01sn02 --tags App=AAA Stage=DevQA

az network vnet route-table create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --location northeurope --name
rb-ne-aaa-dqa-udrvn01sn03 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-ne-aaa-dqa-udrvn01sn03 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.18.4

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi3 --route-table-name
rb-ne-aaa-dqa-udrvn01sn03 --address-prefix 192.168.17.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.18.4

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi3 --route-table-name
rb-ne-aaa-dqa-udrvn01sn03 --address-prefix 192.168.19.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.18.4

az network vnet route-table create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --location northeurope --name
rb-ne-aaa-dqa-udrvn01sn04 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-ne-aaa-dqa-udrvn01sn04 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.19.4

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi4 --route-table-name
rb-ne-aaa-dqa-udrvn01sn04 --address-prefix 192.168.17.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.19.4

az network route-table route create --resource-group
rb-ne-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi4 --route-table-name
rb-ne-aaa-dqa-udrvn01sn04 --address-prefix 192.168.18.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.19.4

az network vnet route-table create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --location eastus --name
rb-eus-aaa-dqa-udrvn01sn01 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-eus-aaa-dqa-udrvn01sn01 --address-prefix 192.168.33.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-eus-aaa-dqa-udrvn01sn01 --address-prefix 192.168.34.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-eus-aaa-dqa-udrvn01sn01 --address-prefix 192.168.35.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --location eastus --name
rb-eus-aaa-dqa-udrvn01sn02 --tags App=AAA Stage=DevQA

az network vnet route-table create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --location eastus --name
rb-eus-aaa-dqa-udrvn01sn03 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-eus-aaa-dqa-udrvn01sn03 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.34.4

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi3 --route-table-name
rb-eus-aaa-dqa-udrvn01sn03 --address-prefix 192.168.33.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.34.4

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi3 --route-table-name
rb-eus-aaa-dqa-udrvn01sn03 --address-prefix 192.168.35.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.34.4

az network vnet route-table create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --location eastus --name
rb-eus-aaa-dqa-udrvn01sn04 --tags App=AAA Stage=DevQA

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-eus-aaa-dqa-udrvn01sn04 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.35.4

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN2-CSR-Gi4 --route-table-name
rb-eus-aaa-dqa-udrvn01sn04 --address-prefix 192.168.33.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.35.4

az network route-table route create --resource-group
rb-eus-aaa-dqa-csrcr-rg01 --name route-VN1SN4-CSR-Gi4 --route-table-name
rb-eus-aaa-dqa-udrvn01sn04 --address-prefix 192.168.34.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.35.4

az network vnet route-table create --resource-group
rb-we-aaa-prod-csrcr-rg01 --location westeurope --name
rb-we-aaa-prod-udrvn01sn01 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-we-aaa-prod-udrvn01sn01 --address-prefix 192.168.113.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-we-aaa-prod-udrvn01sn01 --address-prefix 192.168.114.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-we-aaa-prod-udrvn01sn01 --address-prefix 192.168.115.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-we-aaa-prod-csrcr-rg01 --location westeurope --name
rb-we-aaa-prod-udrvn01sn02 --tags App=AAA Stage=Prod

az network vnet route-table create --resource-group
rb-we-aaa-prod-csrcr-rg01 --location westeurope --name
rb-we-aaa-prod-udrvn01sn03 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-we-aaa-prod-udrvn01sn03 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.114.4

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi3 --route-table-name
rb-we-aaa-prod-udrvn01sn03 --address-prefix 192.168.113.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.114.4

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi3 --route-table-name
rb-we-aaa-prod-udrvn01sn03 --address-prefix 192.168.115.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.114.4

az network vnet route-table create --resource-group
rb-we-aaa-prod-csrcr-rg01 --location westeurope --name
rb-we-aaa-prod-udrvn01sn04 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-we-aaa-prod-udrvn01sn04 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.115.4

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi4 --route-table-name
rb-we-aaa-prod-udrvn01sn04 --address-prefix 192.168.113.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.115.4

az network route-table route create --resource-group
rb-we-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi4 --route-table-name
rb-we-aaa-prod-udrvn01sn04 --address-prefix 192.168.114.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.115.4

az network vnet route-table create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --location northeurope --name
rb-ne-aaa-prod-udrvn01sn01 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-ne-aaa-prod-udrvn01sn01 --address-prefix 192.168.129.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-ne-aaa-prod-udrvn01sn01 --address-prefix 192.168.130.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-ne-aaa-prod-udrvn01sn01 --address-prefix 192.168.131.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --location northeurope --name
rb-ne-aaa-prod-udrvn01sn02 --tags App=AAA Stage=Prod

az network vnet route-table create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --location northeurope --name
rb-ne-aaa-prod-udrvn01sn03 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-ne-aaa-prod-udrvn01sn03 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.130.4

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi3 --route-table-name
rb-ne-aaa-prod-udrvn01sn03 --address-prefix 192.168.129.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.130.4

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi3 --route-table-name
rb-ne-aaa-prod-udrvn01sn03 --address-prefix 192.168.131.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.130.4

az network vnet route-table create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --location northeurope --name
rb-ne-aaa-prod-udrvn01sn04 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-ne-aaa-prod-udrvn01sn04 --address-prefix 0.0.0.0/0
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.131.4

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi4 --route-table-name
rb-ne-aaa-prod-udrvn01sn04 --address-prefix 192.168.129.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.131.4

az network route-table route create --resource-group
rb-ne-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi4 --route-table-name
rb-ne-aaa-prod-udrvn01sn04 --address-prefix 192.168.130.0/24
--next-hop-type VirtualAppliance --next-hop-ip-address 192.168.131.4

az network vnet route-table create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --location eastus --name
rb-eus-aaa-prod-udrvn01sn01 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN2-Null --route-table-name
rb-eus-aaa-prod-udrvn01sn01 --address-prefix 192.168.145.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN3-Null --route-table-name
rb-eus-aaa-prod-udrvn01sn01 --address-prefix 192.168.146.0/24
--next-hop-type None

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN4-Null --route-table-name
rb-eus-aaa-prod-udrvn01sn01 --address-prefix 192.168.147.0/24
--next-hop-type None

az network vnet route-table create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --location eastus --name
rb-eus-aaa-prod-udrvn01sn02 --tags App=AAA Stage=Prod

az network vnet route-table create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --location eastus --name
rb-eus-aaa-prod-udrvn01sn03 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi3
--route-table-name rb-eus-aaa-prod-udrvn01sn03 --address-prefix
0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.146.4

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi3
--route-table-name rb-eus-aaa-prod-udrvn01sn03 --address-prefix
192.168.145.0/24 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.146.4

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi3
--route-table-name rb-eus-aaa-prod-udrvn01sn03 --address-prefix
192.168.147.0/24 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.146.4

az network vnet route-table create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --location eastus --name
rb-eus-aaa-prod-udrvn01sn04 --tags App=AAA Stage=Prod

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-Default0-CSR-Gi4
--route-table-name rb-eus-aaa-prod-udrvn01sn04 --address-prefix
0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.147.4

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN2-CSR-Gi4
--route-table-name rb-eus-aaa-prod-udrvn01sn04 --address-prefix
192.168.145.0/24 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.147.4

az network route-table route create --resource-group
rb-eus-aaa-prod-csrcr-rg01 --name route-VN1SN4-CSR-Gi4
--route-table-name rb-eus-aaa-prod-udrvn01sn04 --address-prefix
192.168.146.0/24 --next-hop-type VirtualAppliance --next-hop-ip-address
192.168.147.4

az network vnet subnet update --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01 --name rb-we-aaa-dqa-vn01-sn01
--route-table rb-we-aaa-dqa-udrvn01sn01

az network vnet subnet update --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01 --name rb-we-aaa-dqa-vn01-sn02
--route-table rb-we-aaa-dqa-udrvn01sn02

az network vnet subnet update --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01 --name rb-we-aaa-dqa-vn01-sn03
--route-table rb-we-aaa-dqa-udrvn01sn03

az network vnet subnet update --resource-group rb-we-aaa-dqa-csrcr-rg01
--vnet-name rb-we-aaa-dqa-vn01 --name rb-we-aaa-dqa-vn01-sn04
--route-table rb-we-aaa-dqa-udrvn01sn04

az network vnet subnet update --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01 --name rb-ne-aaa-dqa-vn01-sn01
--route-table rb-ne-aaa-dqa-udrvn01sn01

az network vnet subnet update --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01 --name rb-ne-aaa-dqa-vn01-sn02
--route-table rb-ne-aaa-dqa-udrvn01sn02

az network vnet subnet update --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01 --name rb-ne-aaa-dqa-vn01-sn03
--route-table rb-ne-aaa-dqa-udrvn01sn03

az network vnet subnet update --resource-group rb-ne-aaa-dqa-csrcr-rg01
--vnet-name rb-ne-aaa-dqa-vn01 --name rb-ne-aaa-dqa-vn01-sn04
--route-table rb-ne-aaa-dqa-udrvn01sn04

az network vnet subnet update --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01 --name rb-eus-aaa-dqa-vn01-sn01
--route-table rb-eus-aaa-dqa-udrvn01sn01

az network vnet subnet update --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01 --name rb-eus-aaa-dqa-vn01-sn02
--route-table rb-eus-aaa-dqa-udrvn01sn02

az network vnet subnet update --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01 --name rb-eus-aaa-dqa-vn01-sn03
--route-table rb-eus-aaa-dqa-udrvn01sn03

az network vnet subnet update --resource-group rb-eus-aaa-dqa-csrcr-rg01
--vnet-name rb-eus-aaa-dqa-vn01 --name rb-eus-aaa-dqa-vn01-sn04
--route-table rb-eus-aaa-dqa-udrvn01sn04

az network vnet subnet update --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01 --name rb-we-aaa-prod-vn01-sn01
--route-table rb-we-aaa-prod-udrvn01sn01

az network vnet subnet update --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01 --name rb-we-aaa-prod-vn01-sn02
--route-table rb-we-aaa-prod-udrvn01sn02

az network vnet subnet update --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01 --name rb-we-aaa-prod-vn01-sn03
--route-table rb-we-aaa-prod-udrvn01sn03

az network vnet subnet update --resource-group rb-we-aaa-prod-csrcr-rg01
--vnet-name rb-we-aaa-prod-vn01 --name rb-we-aaa-prod-vn01-sn04
--route-table rb-we-aaa-prod-udrvn01sn04

az network vnet subnet update --resource-group rb-ne-aaa-prod-csrcr-rg01
--vnet-name rb-ne-aaa-prod-vn01 --name rb-ne-aaa-prod-vn01-sn01
--route-table rb-ne-aaa-prod-udrvn01sn01

az network vnet subnet update --resource-group rb-ne-aaa-prod-csrcr-rg01
--vnet-name rb-ne-aaa-prod-vn01 --name rb-ne-aaa-prod-vn01-sn02
--route-table rb-ne-aaa-prod-udrvn01sn02

az network vnet subnet update --resource-group rb-ne-aaa-prod-csrcr-rg01
--vnet-name rb-ne-aaa-prod-vn01 --name rb-ne-aaa-prod-vn01-sn03
--route-table rb-ne-aaa-prod-udrvn01sn03

az network vnet subnet update --resource-group rb-ne-aaa-prod-csrcr-rg01
--vnet-name rb-ne-aaa-prod-vn01 --name rb-ne-aaa-prod-vn01-sn04
--route-table rb-ne-aaa-prod-udrvn01sn04

az network vnet subnet update --resource-group
rb-eus-aaa-prod-csrcr-rg01 --vnet-name rb-eus-aaa-prod-vn01 --name
rb-eus-aaa-prod-vn01-sn01 --route-table rb-eus-aaa-prod-udrvn01sn01

az network vnet subnet update --resource-group
rb-eus-aaa-prod-csrcr-rg01 --vnet-name rb-eus-aaa-prod-vn01 --name
rb-eus-aaa-prod-vn01-sn02 --route-table rb-eus-aaa-prod-udrvn01sn02

az network vnet subnet update --resource-group
rb-eus-aaa-prod-csrcr-rg01 --vnet-name rb-eus-aaa-prod-vn01 --name
rb-eus-aaa-prod-vn01-sn03 --route-table rb-eus-aaa-prod-udrvn01sn03

az network vnet subnet update --resource-group
rb-eus-aaa-prod-csrcr-rg01 --vnet-name rb-eus-aaa-prod-vn01 --name
rb-eus-aaa-prod-vn01-sn04 --route-table rb-eus-aaa-prod-udrvn01sn04

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

\$Site1Stage1CRRG = "rb-we-aaa-dqa-csrcr-rg01"

\$Site2Stage1CRRG = "rb-ne-aaa-dqa-csrcr-rg01"

\$Site3Stage1CRRG = "rb-eus-aaa-dqa-csrcr-rg01"

\$Site1Stage2CRRG = "rb-we-aaa-prod-csrcr-rg01"

\$Site2Stage2CRRG = "rb-ne-aaa-prod-csrcr-rg01"

\$Site3Stage2CRRG = "rb-eus-aaa-prod-csrcr-rg01"

\$Site1Stage1VNETName = "rb-we-aaa-dqa-vn01"

\$Site2Stage1VNETName = "rb-ne-aaa-dqa-vn01"

\$Site3Stage1VNETName = "rb-eus-aaa-dqa-vn01"

\$Site1Stage2VNETName = "rb-we-aaa-prod-vn01"

\$Site2Stage2VNETName = "rb-ne-aaa-prod-vn01"

\$Site3Stage2VNETName = "rb-eus-aaa-prod-vn01"

\$Site1Stage1MgmtSubnetName = "rb-we-aaa-dqa-vn01-sn01"

\$Site1Stage1OutsideSubnetName = "rb-we-aaa-dqa-vn01-sn02"

\$Site1Stage1DMZSubnetName = "rb-we-aaa-dqa-vn01-sn03"

\$Site1Stage1InsideSubnetName = "rb-we-aaa-dqa-vn01-sn04"

\$Site1Stage2MgmtSubnetName = "rb-we-aaa-prod-vn01-sn01"

\$Site1Stage2OutsideSubnetName = "rb-we-aaa-prod-vn01-sn02"

\$Site1Stage2DMZSubnetName = "rb-we-aaa-prod-vn01-sn03"

\$Site1Stage2InsideSubnetName = "rb-we-aaa-prod-vn01-sn04"

\$Site2Stage1MgmtSubnetName = "rb-ne-aaa-dqa-vn01-sn01"

\$Site2Stage1OutsideSubnetName = "rb-ne-aaa-dqa-vn01-sn02"

\$Site2Stage1DMZSubnetName = "rb-ne-aaa-dqa-vn01-sn03"

\$Site2Stage1InsideSubnetName = "rb-ne-aaa-dqa-vn01-sn04"

\$Site2Stage2MgmtSubnetName = "rb-ne-aaa-prod-vn01-sn01"

\$Site2Stage2OutsideSubnetName = "rb-ne-aaa-prod-vn01-sn02"

\$Site2Stage2DMZSubnetName = "rb-ne-aaa-prod-vn01-sn03"

\$Site2Stage2InsideSubnetName = "rb-ne-aaa-prod-vn01-sn04"

\$Site3Stage1MgmtSubnetName = "rb-eus-aaa-dqa-vn01-sn01"

\$Site3Stage1OutsideSubnetName = "rb-eus-aaa-dqa-vn01-sn02"

\$Site3Stage1DMZSubnetName = "rb-eus-aaa-dqa-vn01-sn03"

\$Site3Stage1InsideSubnetName = "rb-eus-aaa-dqa-vn01-sn04"

\$Site3Stage2MgmtSubnetName = "rb-eus-aaa-prod-vn01-sn01"

\$Site3Stage2OutsideSubnetName = "rb-eus-aaa-prod-vn01-sn02"

\$Site3Stage2DMZSubnetName = "rb-eus-aaa-prod-vn01-sn03"

\$Site3Stage2InsideSubnetName = "rb-eus-aaa-prod-vn01-sn04"

\$Site1Stage1MgmtSubnetPrefix = "192.168.0.0/24"

\$Site1Stage1OutsideSubnetPrefix = "192.168.1.0/24"

\$Site1Stage1DMZSubnetPrefix = "192.168.2.0/24"

\$Site1Stage1InsideSubnetPrefix = "192.168.3.0/24"

\$Site1Stage2MgmtSubnetPrefix = "192.168.112.0/24"

\$Site1Stage2OutsideSubnetPrefix = "192.168.113.0/24"

\$Site1Stage2DMZSubnetPrefix = "192.168.114.0/24"

\$Site1Stage2InsideSubnetPrefix = "192.168.115.0/24"

\$Site2Stage1MgmtSubnetPrefix = "192.168.16.0/24"

\$Site2Stage1OutsideSubnetPrefix = "192.168.17.0/24"

\$Site2Stage1DMZSubnetPrefix = "192.168.18.0/24"

\$Site2Stage1InsideSubnetPrefix = "192.168.19.0/24"

\$Site2Stage2MgmtSubnetPrefix = "192.168.128.0/24"

\$Site2Stage2OutsideSubnetPrefix = "192.168.129.0/24"

\$Site2Stage2DMZSubnetPrefix = "192.168.130.0/24"

\$Site2Stage2InsideSubnetPrefix = "192.168.131.0/24"

\$Site3Stage1MgmtSubnetPrefix = "192.168.32.0/24"

\$Site3Stage1OutsideSubnetPrefix = "192.168.33.0/24"

\$Site3Stage1DMZSubnetPrefix = "192.168.34.0/24"

\$Site3Stage1InsideSubnetPrefix = "192.168.35.0/24"

\$Site3Stage2MgmtSubnetPrefix = "192.168.144.0/24"

\$Site3Stage2OutsideSubnetPrefix = "192.168.145.0/24"

\$Site3Stage2DMZSubnetPrefix = "192.168.146.0/24"

\$Site3Stage2InsideSubnetPrefix = "192.168.147.0/24"

\$Site1Stage1MgmtCSR1IP = "192.168.0.4"

\$Site1Stage1OutsideCSR1IP = "192.168.1.4"

\$Site1Stage1DMZCSR1IP = "192.168.2.4"

\$Site1Stage1InsideCSR1IP = "192.168.3.4"

\$Site1Stage2MgmtCSR1IP = "192.168.112.4"

\$Site1Stage2OutsideCSR1IP = "192.168.113.4"

\$Site1Stage2DMZCSR1IP = "192.168.114.4"

\$Site1Stage2InsideCSR1IP = "192.168.115.4"

\$Site2Stage1MgmtCSR1IP = "192.168.16.4"

\$Site2Stage1OutsideCSR1IP = "192.168.17.4"

\$Site2Stage1DMZCSR1IP = "192.168.18.4"

\$Site2Stage1InsideCSR1IP = "192.168.19.4"

\$Site2Stage2MgmtCSR1IP = "192.168.128.4"

\$Site2Stage2OutsideCSR1IP = "192.168.129.4"

\$Site2Stage2DMZCSR1IP = "192.168.130.4"

\$Site2Stage2InsideCSR1IP = "192.168.131.4"

\$Site3Stage1MgmtCSR1IP = "192.168.32.4"

\$Site3Stage1OutsideCSR1IP = "192.168.33.4"

\$Site3Stage1DMZCSR1IP = "192.168.34.4"

\$Site3Stage1InsideCSR1IP = "192.168.35.4"

\$Site3Stage2MgmtCSR1IP = "192.168.144.4"

\$Site3Stage2OutsideCSR1IP = "192.168.145.4"

\$Site3Stage2DMZCSR1IP = "192.168.146.4"

\$Site3Stage2InsideCSR1IP = "192.168.147.4"

\$Site1Stage1MgmtUDRName = "rb-we-aaa-dqa-udrvn01sn01"

\$Site1Stage1OutsideUDRName = "rb-we-aaa-dqa-udrvn01sn02"

\$Site1Stage1DMZUDRName = "rb-we-aaa-dqa-udrvn01sn03"

\$Site1Stage1InsideUDRName = "rb-we-aaa-dqa-udrvn01sn04"

\$Site1Stage2MgmtUDRName = "rb-we-aaa-prod-udrvn01sn01"

\$Site1Stage2OutsideUDRName = "rb-we-aaa-prod-udrvn01sn02"

\$Site1Stage2DMZUDRName = "rb-we-aaa-prod-udrvn01sn03"

\$Site1Stage2InsideUDRName = "rb-we-aaa-prod-udrvn01sn04"

\$Site2Stage1MgmtUDRName = "rb-ne-aaa-dqa-udrvn01sn01"

\$Site2Stage1OutsideUDRName = "rb-ne-aaa-dqa-udrvn01sn02"

\$Site2Stage1DMZUDRName = "rb-ne-aaa-dqa-udrvn01sn03"

\$Site2Stage1InsideUDRName = "rb-ne-aaa-dqa-udrvn01sn04"

\$Site2Stage2MgmtUDRName = "rb-ne-aaa-prod-udrvn01sn01"

\$Site2Stage2OutsideUDRName = "rb-ne-aaa-prod-udrvn01sn02"

\$Site2Stage2DMZUDRName = "rb-ne-aaa-prod-udrvn01sn03"

\$Site2Stage2InsideUDRName = "rb-ne-aaa-prod-udrvn01sn04"

\$Site3Stage1MgmtUDRName = "rb-eus-aaa-dqa-udrvn01sn01"

\$Site3Stage1OutsideUDRName = "rb-eus-aaa-dqa-udrvn01sn02"

\$Site3Stage1DMZUDRName = "rb-eus-aaa-dqa-udrvn01sn03"

\$Site3Stage1InsideUDRName = "rb-eus-aaa-dqa-udrvn01sn04"

\$Site3Stage2MgmtUDRName = "rb-eus-aaa-prod-udrvn01sn01"

\$Site3Stage2OutsideUDRName = "rb-eus-aaa-prod-udrvn01sn02"

\$Site3Stage2DMZUDRName = "rb-eus-aaa-prod-udrvn01sn03"

\$Site3Stage2InsideUDRName = "rb-eus-aaa-prod-udrvn01sn04"

\$routeVN1SN2NullonVN1SN1Name = "route-VN1SN1-Null"

\$routeVN1SN2NullonVN1SN1Name = "route-VN1SN2-Null"

\$routeVN1SN3NullonVN1SN1Name = "route-VN1SN3-Null"

\$routeVN1SN4NullonVN1SN1Name = "route-VN1SN4-Null"

\$routeDefault0CSRGi3onVN1SN3Name = "route-Default0-CSR-Gi3"

\$routeVN1SN2CSRGi3onVN1SN3Name = "route-VN1SN2-CSR-Gi3"

\$routeVN1SN4CSRGi3onVN1SN3Name = "route-VN1SN4-CSR-Gi3"

\$routeDefault0CSRGi4onVN1SN4Name = "route-Default0-CSR-Gi4"

\$routeVN1SN3CSRGi4onVN1SN4Name = "route-VN1SN3-CSR-Gi4"

\$routeVN1SN4CSRGi4onVN1SN4Name = "route-VN1SN4-CSR-Gi4"

\$Site1Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage1CRRG" -Location "\$Site1" -Name "\$Site1Stage1MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage1CRRG" -Name "\$Site1Stage1VNETName"

\$Site1Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage1VNETPSOut -Name
"\$Site1Stage1MgmtSubnetName" -AddressPrefix
"\$Site1Stage1MgmtSubnetPrefix" -RouteTable \$Site1Stage1MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage1MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage1OutsideSubnetPrefix" -RouteTable
\$Site1Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage1DMZSubnetPrefix" -RouteTable
\$Site1Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage1InsideSubnetPrefix" -RouteTable
\$Site1Stage1MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site1Stage1MgmtUDRPSOut

\$Site1Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage1CRRG" -Location "\$Site1" -Name
"\$Site1Stage1OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage1CRRG" -Name "\$Site1Stage1VNETName"

\$Site1Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage1VNETPSOut -Name
"\$Site1Stage1OutsideSubnetName" -AddressPrefix
"\$Site1Stage1OutsideSubnetPrefix" -RouteTable
\$Site1Stage1OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site1Stage1OutsideSubnetPSOut

\$Site1Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage1CRRG" -Location "\$Site1" -Name "\$Site1Stage1DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage1CRRG" -Name "\$Site1Stage1VNETName"

\$Site1Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage1VNETPSOut -Name
"\$Site1Stage1DMZSubnetName" -AddressPrefix
"\$Site1Stage1DMZSubnetPrefix" -RouteTable \$Site1Stage1DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage1DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site1Stage1DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site1Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site1Stage1OutsideSubnetPrefix" -RouteTable
\$Site1Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site1Stage1InsideSubnetPrefix" -RouteTable
\$Site1Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage1DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site1Stage1DMZUDRPSOut

\$Site1Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage1CRRG" -Location "\$Site1" -Name
"\$Site1Stage1InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage1CRRG" -Name "\$Site1Stage1VNETName"

\$Site1Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage1VNETPSOut -Name
"\$Site1Stage1InsideSubnetName" -AddressPrefix
"\$Site1Stage1InsideSubnetPrefix" -RouteTable
\$Site1Stage1InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage1InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site1Stage1InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site1Stage1OutsideSubnetPrefix" -RouteTable
\$Site1Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site1Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site1Stage1DMZSubnetPrefix" -RouteTable
\$Site1Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site1Stage1InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site1Stage1InsideUDRPSOut

\$Site2Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage1CRRG" -Location "\$Site2" -Name "\$Site2Stage1MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage1CRRG" -Name "\$Site2Stage1VNETName"

\$Site2Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage1VNETPSOut -Name
"\$Site2Stage1MgmtSubnetName" -AddressPrefix
"\$Site2Stage1MgmtSubnetPrefix" -RouteTable \$Site2Stage1MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage1MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage1OutsideSubnetPrefix" -RouteTable
\$Site2Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage1DMZSubnetPrefix" -RouteTable
\$Site2Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage1InsideSubnetPrefix" -RouteTable
\$Site2Stage1MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site2Stage1MgmtUDRPSOut

\$Site2Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage1CRRG" -Location "\$Site2" -Name
"\$Site2Stage1OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage1CRRG" -Name "\$Site2Stage1VNETName"

\$Site2Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage1VNETPSOut -Name
"\$Site2Stage1OutsideSubnetName" -AddressPrefix
"\$Site2Stage1OutsideSubnetPrefix" -RouteTable
\$Site2Stage1OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site2Stage1OutsideSubnetPSOut

\$Site2Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage1CRRG" -Location "\$Site2" -Name "\$Site2Stage1DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage1CRRG" -Name "\$Site2Stage1VNETName"

\$Site2Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage1VNETPSOut -Name
"\$Site2Stage1DMZSubnetName" -AddressPrefix
"\$Site2Stage1DMZSubnetPrefix" -RouteTable \$Site2Stage1DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage1DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site2Stage1DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site2Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site2Stage1OutsideSubnetPrefix" -RouteTable
\$Site2Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site2Stage1InsideSubnetPrefix" -RouteTable
\$Site2Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage1DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site2Stage1DMZUDRPSOut

\$Site2Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage1CRRG" -Location "\$Site2" -Name
"\$Site2Stage1InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage1CRRG" -Name "\$Site2Stage1VNETName"

\$Site2Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage1VNETPSOut -Name
"\$Site2Stage1InsideSubnetName" -AddressPrefix
"\$Site2Stage1InsideSubnetPrefix" -RouteTable
\$Site2Stage1InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage1InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site2Stage1InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site2Stage1OutsideSubnetPrefix" -RouteTable
\$Site2Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site2Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site2Stage1DMZSubnetPrefix" -RouteTable
\$Site2Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site2Stage1InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site2Stage1InsideUDRPSOut

\$Site3Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage1CRRG" -Location "\$Site3" -Name "\$Site3Stage1MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage1CRRG" -Name "\$Site3Stage1VNETName"

\$Site3Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage1VNETPSOut -Name
"\$Site3Stage1MgmtSubnetName" -AddressPrefix
"\$Site3Stage1MgmtSubnetPrefix" -RouteTable \$Site3Stage1MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage1MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage1OutsideSubnetPrefix" -RouteTable
\$Site3Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage1DMZSubnetPrefix" -RouteTable
\$Site3Stage1MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage1InsideSubnetPrefix" -RouteTable
\$Site3Stage1MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site3Stage1MgmtUDRPSOut

\$Site3Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage1CRRG" -Location "\$Site3" -Name
"\$Site3Stage1OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage1CRRG" -Name "\$Site3Stage1VNETName"

\$Site3Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage1VNETPSOut -Name
"\$Site3Stage1OutsideSubnetName" -AddressPrefix
"\$Site3Stage1OutsideSubnetPrefix" -RouteTable
\$Site3Stage1OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site3Stage1OutsideSubnetPSOut

\$Site3Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage1CRRG" -Location "\$Site3" -Name "\$Site3Stage1DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage1CRRG" -Name "\$Site3Stage1VNETName"

\$Site3Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage1VNETPSOut -Name
"\$Site3Stage1DMZSubnetName" -AddressPrefix
"\$Site3Stage1DMZSubnetPrefix" -RouteTable \$Site3Stage1DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage1DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site3Stage1DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site3Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site3Stage1OutsideSubnetPrefix" -RouteTable
\$Site3Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage1DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site3Stage1InsideSubnetPrefix" -RouteTable
\$Site3Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage1DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site3Stage1DMZUDRPSOut

\$Site3Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage1CRRG" -Location "\$Site3" -Name
"\$Site3Stage1InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage1" }

\$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage1CRRG" -Name "\$Site3Stage1VNETName"

\$Site3Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage1VNETPSOut -Name
"\$Site3Stage1InsideSubnetName" -AddressPrefix
"\$Site3Stage1InsideSubnetPrefix" -RouteTable
\$Site3Stage1InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage1InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site3Stage1InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site3Stage1OutsideSubnetPrefix" -RouteTable
\$Site3Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site3Stage1InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site3Stage1DMZSubnetPrefix" -RouteTable
\$Site3Stage1InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site3Stage1InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site3Stage1InsideUDRPSOut

\$Site1Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage2CRRG" -Location "\$Site1" -Name "\$Site1Stage2MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage2CRRG" -Name "\$Site1Stage2VNETName"

\$Site1Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage2VNETPSOut -Name
"\$Site1Stage2MgmtSubnetName" -AddressPrefix
"\$Site1Stage2MgmtSubnetPrefix" -RouteTable \$Site1Stage2MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage2MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage2OutsideSubnetPrefix" -RouteTable
\$Site1Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage2DMZSubnetPrefix" -RouteTable
\$Site1Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site1Stage2InsideSubnetPrefix" -RouteTable
\$Site1Stage2MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site1Stage2MgmtUDRPSOut

\$Site1Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage2CRRG" -Location "\$Site1" -Name
"\$Site1Stage2OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage2CRRG" -Name "\$Site1Stage2VNETName"

\$Site1Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage2VNETPSOut -Name
"\$Site1Stage2OutsideSubnetName" -AddressPrefix
"\$Site1Stage2OutsideSubnetPrefix" -RouteTable
\$Site1Stage2OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site1Stage2OutsideSubnetPSOut

\$Site1Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage2CRRG" -Location "\$Site1" -Name "\$Site1Stage2DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage2CRRG" -Name "\$Site1Stage2VNETName"

\$Site1Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage2VNETPSOut -Name
"\$Site1Stage2DMZSubnetName" -AddressPrefix
"\$Site1Stage2DMZSubnetPrefix" -RouteTable \$Site1Stage2DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage2DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site1Stage2DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site1Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site1Stage2OutsideSubnetPrefix" -RouteTable
\$Site1Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site1Stage2InsideSubnetPrefix" -RouteTable
\$Site1Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage2DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site1Stage2DMZUDRPSOut

\$Site1Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site1Stage2CRRG" -Location "\$Site1" -Name
"\$Site1Stage2InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site1Stage2CRRG" -Name "\$Site1Stage2VNETName"

\$Site1Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site1Stage2VNETPSOut -Name
"\$Site1Stage2InsideSubnetName" -AddressPrefix
"\$Site1Stage2InsideSubnetPrefix" -RouteTable
\$Site1Stage2InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site1Stage2InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site1Stage2InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site1Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site1Stage2OutsideSubnetPrefix" -RouteTable
\$Site1Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site1Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site1Stage2DMZSubnetPrefix" -RouteTable
\$Site1Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site1Stage2InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site1Stage2InsideUDRPSOut

\$Site2Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage2CRRG" -Location "\$Site2" -Name "\$Site2Stage2MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage2CRRG" -Name "\$Site2Stage2VNETName"

\$Site2Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage2VNETPSOut -Name
"\$Site2Stage2MgmtSubnetName" -AddressPrefix
"\$Site2Stage2MgmtSubnetPrefix" -RouteTable \$Site2Stage2MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage2MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage2OutsideSubnetPrefix" -RouteTable
\$Site2Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage2DMZSubnetPrefix" -RouteTable
\$Site2Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site2Stage2InsideSubnetPrefix" -RouteTable
\$Site2Stage2MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site2Stage2MgmtUDRPSOut

\$Site2Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage2CRRG" -Location "\$Site2" -Name
"\$Site2Stage2OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage2CRRG" -Name "\$Site2Stage2VNETName"

\$Site2Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage2VNETPSOut -Name
"\$Site2Stage2OutsideSubnetName" -AddressPrefix
"\$Site2Stage2OutsideSubnetPrefix" -RouteTable
\$Site2Stage2OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site2Stage2OutsideSubnetPSOut

\$Site2Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage2CRRG" -Location "\$Site2" -Name "\$Site2Stage2DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage2CRRG" -Name "\$Site2Stage2VNETName"

\$Site2Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage2VNETPSOut -Name
"\$Site2Stage2DMZSubnetName" -AddressPrefix
"\$Site2Stage2DMZSubnetPrefix" -RouteTable \$Site2Stage2DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage2DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site2Stage2DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site2Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site2Stage2OutsideSubnetPrefix" -RouteTable
\$Site2Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site2Stage2InsideSubnetPrefix" -RouteTable
\$Site2Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage2DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site2Stage2DMZUDRPSOut

\$Site2Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site2Stage2CRRG" -Location "\$Site2" -Name
"\$Site2Stage2InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site2Stage2CRRG" -Name "\$Site2Stage2VNETName"

\$Site2Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site2Stage2VNETPSOut -Name
"\$Site2Stage2InsideSubnetName" -AddressPrefix
"\$Site2Stage2InsideSubnetPrefix" -RouteTable
\$Site2Stage2InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site2Stage2InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site2Stage2InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site2Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site2Stage2OutsideSubnetPrefix" -RouteTable
\$Site2Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site2Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site2Stage2DMZSubnetPrefix" -RouteTable
\$Site2Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site2Stage2InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site2Stage2InsideUDRPSOut

\$Site3Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage2CRRG" -Location "\$Site3" -Name "\$Site3Stage2MgmtUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage2CRRG" -Name "\$Site3Stage2VNETName"

\$Site3Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage2VNETPSOut -Name
"\$Site3Stage2MgmtSubnetName" -AddressPrefix
"\$Site3Stage2MgmtSubnetPrefix" -RouteTable \$Site3Stage2MgmtUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage2MgmtSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeVN1SN2NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage2OutsideSubnetPrefix" -RouteTable
\$Site3Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN3NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage2DMZSubnetPrefix" -RouteTable
\$Site3Stage2MgmtUDRPSOut -NextHopType None

Add-AzureRmRouteConfig -Name "\$routeVN1SN4NullonVN1SN1Name"
-AddressPrefix "\$Site3Stage2InsideSubnetPrefix" -RouteTable
\$Site3Stage2MgmtUDRPSOut -NextHopType None

Set-AzureRmRouteTable -RouteTable \$Site3Stage2MgmtUDRPSOut

\$Site3Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage2CRRG" -Location "\$Site3" -Name
"\$Site3Stage2OutsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage2CRRG" -Name "\$Site3Stage2VNETName"

\$Site3Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage2VNETPSOut -Name
"\$Site3Stage2OutsideSubnetName" -AddressPrefix
"\$Site3Stage2OutsideSubnetPrefix" -RouteTable
\$Site3Stage2OutsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork
\$Site3Stage2OutsideSubnetPSOut

\$Site3Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage2CRRG" -Location "\$Site3" -Name "\$Site3Stage2DMZUDRName"
-Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage2CRRG" -Name "\$Site3Stage2VNETName"

\$Site3Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage2VNETPSOut -Name
"\$Site3Stage2DMZSubnetName" -AddressPrefix
"\$Site3Stage2DMZSubnetPrefix" -RouteTable \$Site3Stage2DMZUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage2DMZSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi3onVN1SN3Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site3Stage2DMZUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress "\$Site3Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN2CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site3Stage2OutsideSubnetPrefix" -RouteTable
\$Site3Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage2DMZCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi3onVN1SN3Name"
-AddressPrefix "\$Site3Stage2InsideSubnetPrefix" -RouteTable
\$Site3Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage2DMZCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site3Stage2DMZUDRPSOut

\$Site3Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName
"\$Site3Stage2CRRG" -Location "\$Site3" -Name
"\$Site3Stage2InsideUDRName" -Tag @{ App="\$App"; Stage="\$Stage2" }

\$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName
"\$Site3Stage2CRRG" -Name "\$Site3Stage2VNETName"

\$Site3Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig
-VirtualNetwork \$Site3Stage2VNETPSOut -Name
"\$Site3Stage2InsideSubnetName" -AddressPrefix
"\$Site3Stage2InsideSubnetPrefix" -RouteTable
\$Site3Stage2InsideUDRPSOut

Set-AzureRmVirtualNetwork -VirtualNetwork \$Site3Stage2InsideSubnetPSOut

Add-AzureRmRouteConfig -Name "\$routeDefault0CSRGi4onVN1SN4Name"
-AddressPrefix 0.0.0.0/0 -RouteTable \$Site3Stage2InsideUDRPSOut
-NextHopType VirtualAppliance -NextHopIpAddress
"\$Site3Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN3CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site3Stage2OutsideSubnetPrefix" -RouteTable
\$Site3Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site3Stage2InsideCSR1IP"

Add-AzureRmRouteConfig -Name "\$routeVN1SN4CSRGi4onVN1SN4Name"
-AddressPrefix "\$Site3Stage2DMZSubnetPrefix" -RouteTable
\$Site3Stage2InsideUDRPSOut -NextHopType VirtualAppliance
-NextHopIpAddress "\$Site3Stage2InsideCSR1IP"

Set-AzureRmRouteTable -RouteTable \$Site3Stage2InsideUDRPSOut

#### **Public IPs**

Command line

az network public-ip create --resource-group rb-we-aaa-dqa-csrcr-rg01
--name rb-we-aaa-dqa-pipm01 --dns-name rb-we-aaa-dqa-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-we-aaa-dqa-csrcr-rg01
--name rb-we-aaa-dqa-pipm02 --dns-name rb-we-aaa-dqa-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-we-aaa-dqa-csrcr-rg01
--name rb-we-aaa-dqa-pipd01 --dns-name rb-we-aaa-dqa-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-we-aaa-dqa-csrcr-rg01
--name rb-we-aaa-dqa-pipd02 --dns-name rb-we-aaa-dqa-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-ne-aaa-dqa-csrcr-rg01
--name rb-ne-aaa-dqa-pipm01 --dns-name rb-ne-aaa-dqa-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-ne-aaa-dqa-csrcr-rg01
--name rb-ne-aaa-dqa-pipm02 --dns-name rb-ne-aaa-dqa-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-ne-aaa-dqa-csrcr-rg01
--name rb-ne-aaa-dqa-pipd01 --dns-name rb-ne-aaa-dqa-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-ne-aaa-dqa-csrcr-rg01
--name rb-ne-aaa-dqa-pipd02 --dns-name rb-ne-aaa-dqa-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-eus-aaa-dqa-csrcr-rg01
--name rb-eus-aaa-dqa-pipm01 --dns-name rb-eus-aaa-dqa-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-eus-aaa-dqa-csrcr-rg01
--name rb-eus-aaa-dqa-pipm02 --dns-name rb-eus-aaa-dqa-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-eus-aaa-dqa-csrcr-rg01
--name rb-eus-aaa-dqa-pipd01 --dns-name rb-eus-aaa-dqa-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-eus-aaa-dqa-csrcr-rg01
--name rb-eus-aaa-dqa-pipd02 --dns-name rb-eus-aaa-dqa-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-we-aaa-prod-csrcr-rg01
--name rb-we-aaa-prod-pipm01 --dns-name rb-we-aaa-prod-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-we-aaa-prod-csrcr-rg01
--name rb-we-aaa-prod-pipm02 --dns-name rb-we-aaa-prod-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-we-aaa-prod-csrcr-rg01
--name rb-we-aaa-prod-pipd01 --dns-name rb-we-aaa-prod-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-we-aaa-prod-csrcr-rg01
--name rb-we-aaa-prod-pipd02 --dns-name rb-we-aaa-prod-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-ne-aaa-prod-csrcr-rg01
--name rb-ne-aaa-prod-pipm01 --dns-name rb-ne-aaa-prod-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-ne-aaa-prod-csrcr-rg01
--name rb-ne-aaa-prod-pipm02 --dns-name rb-ne-aaa-prod-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-ne-aaa-prod-csrcr-rg01
--name rb-ne-aaa-prod-pipd01 --dns-name rb-ne-aaa-prod-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-ne-aaa-prod-csrcr-rg01
--name rb-ne-aaa-prod-pipd02 --dns-name rb-ne-aaa-prod-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-eus-aaa-prod-csrcr-rg01
--name rb-eus-aaa-prod-pipm01 --dns-name rb-eus-aaa-prod-pipm01 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-eus-aaa-prod-csrcr-rg01
--name rb-eus-aaa-prod-pipm02 --dns-name rb-eus-aaa-prod-pipm02 --tags
App=AAA Stage=DevQA

az network public-ip create --resource-group rb-eus-aaa-prod-csrcr-rg01
--name rb-eus-aaa-prod-pipd01 --dns-name rb-eus-aaa-prod-pipd01
--allocation-method Static --tags App=AAA Stage=Prod

az network public-ip create --resource-group rb-eus-aaa-prod-csrcr-rg01
--name rb-eus-aaa-prod-pipd02 --dns-name rb-eus-aaa-prod-pipd02
--allocation-method Static --tags App=AAA Stage=Prod

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

\$Site1Stage1MPIPRG = "rb-we-aaa-dqa-pipm-rg01"

\$Site2Stage1MPIPRG = "rb-ne-aaa-dqa-pipm-rg01"

\$Site3Stage1MPIPRG = "rb-eus-aaa-dqa-pipm-rg01"

\$Site1Stage2MPIPRG = "rb-we-aaa-prod-pipm-rg01"

\$Site2Stage2MPIPRG = "rb-ne-aaa-prod-pipm-rg01"

\$Site3Stage2MPIPRG = "rb-eus-aaa-prod-pipm-rg01"

\$Site1Stage1DPIPRG = "rb-we-aaa-dqa-pipd-rg01"

\$Site2Stage1DPIPRG = "rb-ne-aaa-dqa-pipd-rg01"

\$Site3Stage1DPIPRG = "rb-eus-aaa-dqa-pipd-rg01"

\$Site1Stage2DPIPRG = "rb-we-aaa-prod-pipd-rg01"

\$Site2Stage2DPIPRG = "rb-ne-aaa-prod-pipd-rg01"

\$Site3Stage2DPIPRG = "rb-eus-aaa-prod-pipd-rg01"

\$Site1Stage1MPIP1 = "rb-we-aaa-dqa-pipm01"

\$Site1Stage1MPIP2 = "rb-we-aaa-dqa-pipm02"

\$Site2Stage1MPIP1 = "rb-ne-aaa-dqa-pipm01"

\$Site2Stage1MPIP2 = "rb-ne-aaa-dqa-pipm02"

\$Site3Stage1MPIP1 = "rb-eus-aaa-dqa-pipm01"

\$Site3Stage1MPIP2 = "rb-eus-aaa-dqa-pipm02"

\$Site1Stage2MPIP1 = "rb-we-aaa-prod-pipm01"

\$Site1Stage2MPIP2 = "rb-we-aaa-prod-pipm02"

\$Site2Stage2MPIP1 = "rb-ne-aaa-prod-pipm01"

\$Site2Stage2MPIP2 = "rb-ne-aaa-prod-pipm02"

\$Site3Stage2MPIP1 = "rb-eus-aaa-prod-pipm01"

\$Site3Stage2MPIP2 = "rb-eus-aaa-prod-pipm02"

\$Site1Stage1DPIP1 = "rb-we-aaa-dqa-pipd01"

\$Site1Stage1DPIP2 = "rb-we-aaa-dqa-pipd02"

\$Site2Stage1DPIP1 = "rb-ne-aaa-dqa-pipd01"

\$Site2Stage1DPIP2 = "rb-ne-aaa-dqa-pipd02"

\$Site3Stage1DPIP1 = "rb-eus-aaa-dqa-pipd01"

\$Site3Stage1DPIP2 = "rb-eus-aaa-dqa-pipd02"

\$Site1Stage2DPIP1 = "rb-we-aaa-prod-pipd01"

\$Site1Stage2DPIP2 = "rb-we-aaa-prod-pipd02"

\$Site2Stage2DPIP1 = "rb-ne-aaa-prod-pipd01"

\$Site2Stage2DPIP2 = "rb-ne-aaa-prod-pipd02"

\$Site3Stage2DPIP1 = "rb-eus-aaa-prod-pipd01"

\$Site3Stage2DPIP2 = "rb-eus-aaa-prod-pipd02"

New-AzureRmPublicIpAddress -Name "\$Site1Stage1MPIP1" -ResourceGroupName
"\$Site1Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site1Stage1MPIP1" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage1MPIP2" -ResourceGroupName
"\$Site1Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site1Stage1MPIP2" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage1MPIP1" -ResourceGroupName
"\$Site2Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site2Stage1MPIP1" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage1MPIP2" -ResourceGroupName
"\$Site2Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site2Stage1MPIP2" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage1MPIP1" -ResourceGroupName
"\$Site3Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site3Stage1MPIP1" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage1MPIP2" -ResourceGroupName
"\$Site3Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site3Stage1MPIP2" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage2MPIP1" -ResourceGroupName
"\$Site1Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site1Stage2MPIP1" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage2MPIP2" -ResourceGroupName
"\$Site1Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site1Stage2MPIP2" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage2MPIP1" -ResourceGroupName
"\$Site2Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site2Stage2MPIP1" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage2MPIP2" -ResourceGroupName
"\$Site2Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site2Stage2MPIP2" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage2MPIP1" -ResourceGroupName
"\$Site3Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site3Stage2MPIP1" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage2MPIP2" -ResourceGroupName
"\$Site3Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel
"\$Site3Stage2MPIP2" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage1DPIP1" -ResourceGroupName
"\$Site1Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site1Stage1DPIP1" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage1DPIP2" -ResourceGroupName
"\$Site1Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site1Stage1DPIP2" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage1DPIP1" -ResourceGroupName
"\$Site2Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site2Stage1DPIP1" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage1DPIP2" -ResourceGroupName
"\$Site2Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site2Stage1DPIP2" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage1DPIP1" -ResourceGroupName
"\$Site3Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site3Stage1DPIP1" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage1DPIP2" -ResourceGroupName
"\$Site3Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site3Stage1DPIP2" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage1" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage2DPIP1" -ResourceGroupName
"\$Site1Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site1Stage2DPIP1" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site1Stage2DPIP2" -ResourceGroupName
"\$Site1Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site1Stage2DPIP2" -Location "\$Site1" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage2DPIP1" -ResourceGroupName
"\$Site2Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site2Stage2DPIP1" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site2Stage2DPIP2" -ResourceGroupName
"\$Site2Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site2Stage2DPIP2" -Location "\$Site2" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage2DPIP1" -ResourceGroupName
"\$Site3Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site3Stage2DPIP1" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage2" }

New-AzureRmPublicIpAddress -Name "\$Site3Stage2DPIP2" -ResourceGroupName
"\$Site3Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel
"\$Site3Stage2DPIP2" -Location "\$Site3" -Tag @{ App="\$App";
Stage="\$Stage2" }

#### **Availability Sets**

Command line

az vm availability-set create --name rb-we-aaa-dqa-csrvm-as01
--resource-group rb-we-aaa-dqa-csrcr-rg01 --platform-fault-domain-count
3 --platform-update-domain-count 4 --tags App=AAA Stage=DevQA

az vm availability-set create --name rb-ne-aaa-dqa-csrvm-as01
--resource-group rb-ne-aaa-dqa-csrcr-rg01 --platform-fault-domain-count
3 --platform-update-domain-count 4 --tags App=AAA Stage=DevQA

az vm availability-set create --name rb-eus-aaa-dqa-csrvm-as01
--resource-group rb-eus-aaa-dqa-csrcr-rg01 --platform-fault-domain-count
3 --platform-update-domain-count 4 --tags App=AAA Stage=DevQA

az vm availability-set create --name rb-we-aaa-prod-csrvm-as01
--resource-group rb-we-aaa-prod-csrcr-rg01 --platform-fault-domain-count
3 --platform-update-domain-count 4 --tags App=AAA Stage=Prod

az vm availability-set create --name rb-ne-aaa-prod-csrvm-as01
--resource-group rb-ne-aaa-prod-csrcr-rg01 --platform-fault-domain-count
3 --platform-update-domain-count 4 --tags App=AAA Stage=Prod

az vm availability-set create --name rb-eus-aaa-prod-csrvm-as01
--resource-group rb-eus-aaa-prod-csrcr-rg01
--platform-fault-domain-count 3 --platform-update-domain-count 4 --tags
App=AAA Stage=Prod

PowerShell

\$App = "AAA"

\$Stage1 = "DevQA"

\$Stage2 = "Prod"

\$Site1 = "westeurope"

\$Site2 = "northeurope"

\$Site3 = "eastus"

\$Site1Stage1CRRG = "rb-we-aaa-dqa-csrcr-rg01"

\$Site2Stage1CRRG = "rb-ne-aaa-dqa-csrcr-rg01"

\$Site3Stage1CRRG = "rb-eus-aaa-dqa-csrcr-rg01"

\$Site1Stage2CRRG = "rb-we-aaa-prod-csrcr-rg01"

\$Site2Stage2CRRG = "rb-ne-aaa-prod-csrcr-rg01"

\$Site3Stage2CRRG = "rb-eus-aaa-prod-csrcr-rg01"

\$Site1Stage1CRCSRVMAS = "rb-we-aaa-dqa-csrvm-as01"

\$Site2Stage1CRCSRVMAS = "rb-ne-aaa-dqa-csrvm-as01"

\$Site3Stage1CRCSRVMAS = "rb-eus-aaa-dqa-csrvm-as01"

\$Site1Stage2CRCSRVMAS = "rb-we-aaa-prod-csrvm-as01"

\$Site2Stage2CRCSRVMAS = "rb-ne-aaa-prod-csrvm-as01"

\$Site3Stage2CRCSRVMAS = "rb-eus-aaa-prod-csrvm-as01"

New-AzureRmAvailabilitySet -Location "\$Site1" -Name
\$Site1Stage1CRCSRVMAS -ResourceGroupName "\$Site1Stage1CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

New-AzureRmAvailabilitySet -Location "\$Site2" -Name
\$Site2Stage1CRCSRVMAS -ResourceGroupName "\$Site2Stage1CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

New-AzureRmAvailabilitySet -Location "\$Site3" -Name
\$Site3Stage1CRCSRVMAS -ResourceGroupName "\$Site2Stage1CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

New-AzureRmAvailabilitySet -Location "\$Site1" -Name
\$Site1Stage2CRCSRVMAS -ResourceGroupName "\$Site1Stage2CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

New-AzureRmAvailabilitySet -Location "\$Site2" -Name
\$Site2Stage2CRCSRVMAS -ResourceGroupName "\$Site2Stage2CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

New-AzureRmAvailabilitySet -Location "\$Site3" -Name
\$Site3Stage2CRCSRVMAS -ResourceGroupName "\$Site3Stage2CRRG"
-PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

Note. Need to add tags.

#### **CSR 1000v VMs**

Command line

??

PowerShell

??

#### **Test VMs**

Deployed from templates hosted at:

Please clone the repository and/or download to your local machine and
then run the deploy.ps1 PowerShell script for each VM, based on the
directory structure, that you wish to deploy.

Don’t collapse from here
========================

Resource Locks

\# Define a credential object

\$securePassword = ConvertTo-SecureString ' ' -AsPlainText -Force

\$cred = New-Object System.Management.Automation.PSCredential
("azureuser", \$securePassword)

\# Create a virtual machine configuration

\$vmConfig = New-AzureRmVMConfig -VMName myVM -VMSize Standard\_D1 | \`

Set-AzureRmVMOperatingSystem -Linux -ComputerName myVM -Credential
\$cred -DisablePasswordAuthentication | \`

Set-AzureRmVMSourceImage -PublisherName Canonical -Offer UbuntuServer
-Skus 16.04-LTS -Version latest | \`

Add-AzureRmVMNetworkInterface -Id \$nic.Id

\# Configure SSH Keys

\$sshPublicKey = Get-Content "\$env:USERPROFILE\\.ssh\\id\_rsa.pub"

Add-AzureRmVMSshPublicKey -VM \$vmconfig -KeyData \$sshPublicKey -Path
"/home/azureuser/.ssh/authorized\_keys"

New-AzureRmVM -ResourceGroupName myResourceGroup -Location eastus -VM
\$vmConfig

CSR VMs

-   New-AzureRmResourceGroupDeployment -Name &lt;deployment-name&gt;
    -ResourceGroupName &lt;resource-group-name&gt; -TemplateUri
    <https://raw.githubusercontent.com/azure/azure-quickstart-templates/master/cisco-csr-1000v-existing-vnet-4-nic/azuredeploy.json>

-   New-AzureRmResourceGroupDeployment -Name rb-ne-aaa-dqa-csrvm101
    -ResourceGroupName rb-ne-aaa-dqa-csrvm-rg101 -TemplateUri
    C:\\Users\\barichar\\Documents\\Customers\\Derby\_City\_Council\\Brown\_Bag\_Sessions\\CiscoCSR1000v\_DMVPNOverlay\_1017\\1\_Try\\azuredeploy.json

-   azure config mode arm

-   azure group deployment create &lt;my-resource-group&gt;
    &lt;my-deployment-name&gt; --template-uri
    <https://raw.githubusercontent.com/azure/azure-quickstart-templates/master/cisco-csr-1000v-existing-vnet-4-nic/azuredeploy.json>

-   azure vm create -g rb-we-aaa-dqa-rg01 -n rb-we-aaa-dqa-csrvm01 -l
    westeurope -z Standard\_D2\_v3 -N
    rb-we-aaa-dqa-vn01,rb-we-aaa-dqa-vn01-sn01 -y Linux -o nbremdmz -R
    vhds -u rbadmin -p M1cr0s0ft -Q
    cisco:cisco-csr-1000v:csr-azure-byol:16\_6 -d
    rb-we-aaa-dqa-csrvm01.vhd --plan-name csr-azure-byol
    --plan-publisher cisco --plan-product cisco-csr-1000v

**Cisco CSR 1000v initial configuration:**

**Cisco CSR 1000v ZBFW configuration:**

**Cisco CSR 1000v DMVPN configuration - Hub:**

**Cisco CSR 1000v DMVPN configuration - Spokes:**

**Azure NSG and Cisco ZBFW side-by-side configuration**

**Azure S2S VPN and Cisco DMVPN side-by-side configuration**

**Adding ExpressRoute into the equation**

**Adding a new subnet:**

Within an existing VNet

New ‘Spoke’ VNet and VNet Peering with an existing ‘Hub’ VNet

**Introducing ExpressRoute**

Gateway Subnet

UDR Gateway Subnet = , Subnet1 = Null additions, Subnet 2 = Hub/Spoke
Peer Addresses (/32s), and Subnets 3+4 = GatewaySubnet prefixes via CSR

Static Routes on CSR 1000vs

#### **What to try next?**

[Deploying a Secure Hybrid Cloud Extension with Cisco CSR 1000V and
LISP](https://www.cisco.com/c/en/us/products/collateral/routers/cloud-services-router-1000v-series/white-paper-c11-731872.html)
for:

-   “Data centre migrations, with no need to rework the workload IP
    address or the firewall rules, ensuring subnet continuity in a
    routed fashion with no broadcast domain extension.

-   SaaS with insertion of the provider application right in the heart
    of the enterprise data centre.

-   IaaS with insertion of the compute overflow right in the heart of
    the enterprise data centre.

-   Cloud bursting with virtual insertion of a virtual machine in the
    enterprise server farm, while the virtual machine is running on the
    provider site.

-   Backup services, for partial disaster recovery and disaster
    avoidance with the capability to clone the failing area and
    reactivate the application space, including storage, because it is
    in the provider space.”

![https://www.cisco.com/c/dam/en/us/products/collateral/routers/cloud-services-router-1000v-series/white-paper-c11-731872.doc/\_jcr\_content/renditions/white-paper-c11-731872\_14.jpg](media/image5.jpeg){width="3.3854166666666665in"
height="1.9784722222222222in"}

![https://www.cisco.com/c/dam/en/us/products/collateral/routers/cloud-services-router-1000v-series/white-paper-c11-731872.doc/\_jcr\_content/renditions/white-paper-c11-731872\_2.jpg](media/image6.jpeg){width="6.0in"
height="3.35625in"}
