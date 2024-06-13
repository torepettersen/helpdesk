defmodule Helpdesk.Support.JobProgrammingLanguage do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: Helpdesk.Support

  alias Helpdesk.Support.Job
  alias Helpdesk.Support.ProgrammingLanguage

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  relationships do
    belongs_to :job, Job, primary_key?: true, allow_nil?: false
    belongs_to :programming_language, ProgrammingLanguage, primary_key?: true, allow_nil?: false
  end

  postgres do
    table "job_programming_languages"
    repo Helpdesk.Repo
  end
end
