## Taskfile Generation

This section provides a high-level view of the end-to-end Taskfile generation flow.  
Starting from the simulation AST, the Builder constructs common tasks, resolves includes, generates model-specific tasks, and assembles the final `Taskfile.yml`.

<div hidden>
```
@startuml highlevel_flow_diagram
title Taskfile.yml Generation - High-Level Flow Diagram
:Run dse-ast generate;
:Load Simulation AST (YAML);
:Build Common Tasks;
:Resolve Includes;
:Generate Model Tasks;
:Assemble All Tasks;
:Write Taskfile.yml;
@enduml
```
</div>

![](highlevel_flow_diagram.png)
