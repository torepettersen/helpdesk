defmodule Helpdesk.Support.Job do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: Helpdesk.Support

  alias Helpdesk.Support.JobProgrammingLanguage
  alias Helpdesk.Support.ProgrammingLanguage
  alias Uniq.UUID

  actions do
    default_accept [:title, :state]
    defaults [:create, :read, :destroy]

    update :update do
      primary? true
      require_atomic? false
      argument :programming_languages, {:array, :map}, allow_nil?: true

      change manage_relationship(:programming_languages, type: :append_and_remove)
    end
  end

  attributes do
    uuid_primary_key :id, default: &UUID.uuid7/0

    attribute :title, :string, allow_nil?: false

    attribute :state, :atom do
      constraints one_of: [:new, :open, :closed]
      default :new
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    many_to_many :programming_languages, ProgrammingLanguage do
      writable? true
      through JobProgrammingLanguage
      source_attribute_on_join_resource :job_id
      destination_attribute_on_join_resource :programming_language_id
    end
  end

  postgres do
    table "jobs"
    repo Helpdesk.Repo
  end
end
