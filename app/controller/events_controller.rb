class EventsController
  def ranking
    EventWorker.perform_async @event.id
  end
end
