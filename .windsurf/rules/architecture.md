# Architecture Rules

Always follow this hierarchy.

```
Presentation

↓

ViewModel

↓

Use Cases

↓

Repositories

↓

Services

↓

Datasource
```

Never skip layers.

Business logic never belongs inside widgets.

Repositories expose interfaces.

Services contain implementations.

Prediction Engine is isolated.

IoT Engine is isolated.

Notification Engine is isolated.

Every feature owns its own

models

providers

repositories

views

widgets

services

Never create a gigantic shared folder.

Prefer feature encapsulation.
