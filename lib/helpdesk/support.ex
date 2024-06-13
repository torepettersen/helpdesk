defmodule Helpdesk.Support do
  use Ash.Domain

  resources do
    resource Helpdesk.Support.Job
    resource Helpdesk.Support.JobProgrammingLanguage
    resource Helpdesk.Support.ProgrammingLanguage
  end
end
