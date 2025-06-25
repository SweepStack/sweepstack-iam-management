terraform {
  cloud {
    workspaces {
      name = locals.workspace_name
    }
  }
}
