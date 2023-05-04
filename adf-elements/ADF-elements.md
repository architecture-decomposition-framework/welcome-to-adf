# Elements and relations reference (Architecture Decomposition Framework)

Version 1.1.0

- [Elements and relations reference (Architecture Decomposition Framework)](#elements-and-relations-reference-architecture-decomposition-framework)
  - [Overview](#overview)
  - [Software@Runtime](#softwareruntime)
  - [Software@Devtime](#softwaredevtime)
  - [Environment@Runtime](#environmentruntime)
  - [Environment@Devtime](#environmentdevtime)
  - [Custom elements and relations](#custom-elements-and-relations)
  - [Footnote](#footnote)

## Overview

This figure shows all elements in overview:

![Overview over ADF elements and relations](ADF-elements-relations-overview.png)

## Software@Runtime

Software = Data and Functions, thus, these elements can be used in views of the types Data@Runtime and Functions@Runtime.

| Element | Description |
| ------- | ----------- |
| ![Role](common/role.drawio.png) | A role represents the interests of a specific group of stakeholders. |
| ![System](sw@rt/system.drawio.png) | The system under study. This is the highest level representation and decomposed in the architecture. |
| ![External System](sw@rt/external_system.drawio.png) | An external system is a system that is in the context of the system under study but can only be partially influenced. External systems send or receive data. |
| ![Layer](sw@rt/layer.drawio.png) | A layer is a logical (horizontal) container for components. It enables to define common access rules for all components contained in the layer. Layers are typically ordered and thus define the direction and hierarchy of accesses. |
| ![Cluster](sw@rt/cluster.drawio.png) |  A cluster is a logical (vertical) container for components. It enables to define common access rules for all components contained in the cluster.  |
| ![Component](sw@rt/component.drawio.png) | A component is a functional self-contained runtime entity handling a concern of a software system. A component can be composed of other components. Components provide and require interfaces to communicate with other components. |
| ![Interface Connector](sw@rt/interface_connector.drawio.png) | Interface connectors can be used with systems or components. Left side (lollypop) provides interface, right side requires interface. An interface connector at runtime can be realized by an [interface element at devtime](#softwaredevtime) which typically uses the same name. |
| ![Interface](sw@rt/interface.drawio.png) | Interfaces elements are used as entities for defining clear component boundaries. Each interface is centered about a specific role that a component has. While for most use cases, the interface connector element (see above) provides enough details, this interface element can provide more specific information about certain interface endpoints or methods, and it can be connected to multiple components to express that they provide or require the same interface. An interface connector at runtime can be realized by an [interface element at devtime](#softwaredevtime) which typically uses the same name. |
| ![Connector](sw@rt/connector.drawio.png) | A connector allows components to communicate with other components that are connected by it. A connector can be used as an abstraction of complex interaction mechanisms. It can be hierarchically composed of further components and connectors realizing the communication. |
| ![Data](sw@rt/data.drawio.png) | To express the exchange of information at runtime between components, via connectors or in and out of the system data entities are used. They adhere to their corresponding data type. |
| ![Technology](common/technology.drawio.png) | A technology represents the usage of third party solutions, packaged as a technology, e.g. in form of a library or tool. |
| ![Dataflow](sw@rt/rel_dataflow.drawio.png) | Dataflow indicates that data flows from one element to the other |
| ![Usage](sw@rt/rel_usage.drawio.png) | Usage indicates that one element uses another element. Thus, it depends on the other element. |
| ![System Scope](sw@rt/system_scope.drawio.png) | Can drawn around several systems or components to indicate that these form the system scope (as opposed to everything else that is the system context). |
| ![Note](common/note.drawio.png) | Note elements are used to give further information or explanation in a diagram. |
| ![Note Relation](common/rel_note.drawio.png) | Connects note elements to certain diagram elements or relations in order to annotate them. |

## Software@Devtime

Software = Data and Functions, thus these elements can be used in views of the types Data@Devtime and Functions@Devtime.

| Element | Description |
| ------- | ----------- |
| ![Module](sw@dt/module.drawio.png) | A module is a development time entity created with the help of development tools that realizes one or more components. |
| ![Interface](sw@dt/interface.drawio.png) | Interfaces are used as entities for defining clear module boundaries. They can be used to abstract from modules that provide a common functionality with different implementations or to realize an [interface connector or interface element at runtime](#softwareruntime) which then typically uses the same name. |
| ![Package](sw@dt/package.drawio.png) | A package is a physical container for modules and helps to organize them. |
| ![Datatype](sw@dt/datatype.drawio.png) | A data type defines how data entities of a specific type are structured, what attributes they contain and how they are related to each other. |
| ![Library](sw@dt/library.drawio.png) | A library enables a system to use specific technology that is packaged in a library. |
| ![Technology](common/technology.drawio.png) | A technology represents the usage of third party solutions, packaged as a technology, e.g. in form of a library or tool. |
| ![Refinement](sw@dt/rel_refinement.drawio.png) | Refinement is a relationship that represents a fuller specification of something that has already been specified at a certain level of detail. For example, a design class is a refinement of an analysis class. |
| ![Usage](sw@dt/rel_usage.drawio.png) | Usage indicates that an elements requires another element for full implementation or operation, e.g. usage of a technology or a library. |
| ![Other UML Relations](sw@dt/rel_uml_class_diagram.drawio.png) | Association, Generalization, Realization, Composition and Aggregation are used as in UML class diagrams (see standard literature on this topic). |
| ![Note](common/note.drawio.png) | Note elements are used to give further information or explanation in a diagram. |
| ![Note Relation](common/rel_note.drawio.png) | Connects note elements to certain diagram elements or relations in order to annotate them. |

## Environment@Runtime

Environment = Deployment and Activities, thus these elements can be used in views of the types Deployment@Runtime and Activities@Runtime.

| Element | Description |
| ------- | ----------- |
| ![Computing Node](en@rt/computing_node.drawio.png) | A computing node represents a (virtual or real) machine. This node is used to execute a deployment artifact or an execution environment. |
| ![Execution Environment](en@rt/execution_environment.drawio.png) | An execution environment runs on a computing node and is capable of executing a deployment artifact. E.g. Browser, Application Server, Docker. |
| ![Deployment Artifact](en@rt/deployment_artifact.drawio.png) | A deployment artifact is a development and operation time entity that can be deployed to a computing node or an execution environment. |
| ![Operation Process](en@rt/operation_process.drawio.png) |  The operation process describes how specific roles operate computing nodes and execution environments in order to execute deployment artifacts. |
| ![Technology](common/technology.drawio.png) | A technology represents the usage of third party solutions, packaged as a technology, e.g. in form of a library or tool. |
| ![Thread](en@rt/thread.drawio.png) | Besides the pure behavior of components in terms of message exchanges, concurrency aspects might be important. Thus, threads of concurrent execution can be expressed and the communication among threads and the assigned components can be sketched. |
| ![Role](common/role.drawio.png) | A role represents the interests of a specific group of stakeholders. |
| ![Organizational Unit](en@rt/organizational_unit.drawio.png) | An organizational unit reflects the organizational structure of involved parties. It helps to structure roles. |
| ![Operate](en@rt/rel_operate.drawio.png) | Operation:  Computing nodes and execution environments are operated by roles or operation processes. |
| ![Execute](en@rt/rel_execute.drawio.png) | Execution: Execution environments execute components (from Software@Runtime views) |
| ![Deploy](en@rt/rel_deploy.drawio.png) | Deployment: Deployment artifacts deploy to computing nodes or execution environments. |
| ![Own](en@rt/rel_own.drawio.png) | Ownership: Roles can own computing nodes and operation processes. |
| ![Manifest](en@rt/rel_manifest.drawio.png) | Manifestation: Deployment artifacts manifest components (from Software@Runtime) |
| ![Communication Path](en@rt/rel_communication_path.drawio.png) | A communication path can be used to model communication paths between computing nodes. |
| ![Note](common/note.drawio.png) | Note elements are used to give further information or explanation in a diagram. |
| ![Note Relation](common/rel_note.drawio.png) | Connects note elements to certain diagram elements or relations in order to annotate them. |

Further custom relations can be expressed (see section "Custom Elements and Relations"), e.g.

- a role *belongs to* an organizational unit, or
- a role *follows* an operation process.

## Environment@Devtime

Environment = Deployment and Activities, thus these elements can be used in views of the types Deployment@Runtime and Activities@Runtime.

| Element | Description |
| ------- | ----------- |
| ![Role](common/role.drawio.png) | A role represents the interests of a specific group of stakeholders. |
| ![Organizational Unit](en@dt/organizational_unit.drawio.png) | An organizational unit reflects the organizational structure of involved parties. It helps to structure roles. |
| ![Project Increment](en@dt/project_increment.drawio.png) | A project increment realizes parts of the system or the final system in terms of modules. |
| ![Deployment Artifact](en@dt/deployment_artifact.drawio.png) | A deployment artifact is a development and operation time entity that can be deployed to a computing node or an execution environment. |
| ![Development Process](en@dt/development_process.drawio.png) | The development process describes how specific roles work together in order to develop a project increment. |
| ![Development Tool](en@dt/development_tool.drawio.png) | A development tool is used during the development process to create modules as an artifact that adheres to a specific technology. |
| ![Technology](common/technology.drawio.png) | A technology represents the usage of third party solutions, packaged as a technology, e.g. in form of a library or tool. |
| ![Manifest](en@rt/rel_manifest.drawio.png) | Manifestation: Deployment Artifacts manifest Modules (from Software@Devtime) |
| ![Usage](en@dt/rel_usage.drawio.png) | Role can use development tools. |
| ![Own](en@dt/rel_own.drawio.png) | Roles can own development processes. |
| ![Note](common/note.drawio.png) | Note elements are used to give further information or explanation in a diagram. |
| ![Note Relation](common/rel_note.drawio.png) | Connects note elements to certain diagram elements or relations in order to annotate them. |

Further custom relations can be expressed (see section "Custom Elements and Relations"), e.g.

- a development process *creates* a project increment, or
- a role *belongs to* an organizational unit.

## Custom elements and relations

Custom elements can be defined whenever the predefined elements are not sufficient to explain the architecture.

| Element | Description |
| ------- | ----------- |
| ![Domain](custom/domain.drawio.png) | Example for a custom element *Domain*. Reuses the cluster element, but as an own type Domain. Its meaning needs to be defined in the context of the architecture documentation. |
| ![Initiation](custom/rel_initiation.drawio.png) | Example for custom relation *initiates*. Its meaning needs to be defined in the context of the architecture documentation. |

## Footnote

This summary was compiled by Johannes Schneider. You can use all material freely under the [CC BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
