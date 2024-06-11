# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "google_dialogflow_cx_page" "start_page" {
  parent       = google_dialogflow_cx_flow.book_flight_flow.id
  display_name = "StartPage"

  transition_routes {
    intent       = google_dialogflow_cx_intent.book_flight_intent.id
    target_page  = google_dialogflow_cx_page.collect_details_page.id
  }
}

resource "google_dialogflow_cx_page" "collect_details_page" {
  parent       = google_dialogflow_cx_flow.book_flight_flow.id
  display_name = "CollectDetailsPage"

  entry_fulfillment {
    messages {
      text {
        text = ["Please provide the following details: departure city, destination, travel dates, places to visit, and preferred airline."]
      }
    }
  }

  form {
    parameters {
      display_name = "departure_city"
      entity_type  = google_dialogflow_cx_entity_type.city.id
      required     = true

      fill_behavior {
        initial_prompt_fulfillment {
          messages {
            text {
              text = ["What is your departure city?"]
            }
          }
        }
      }
    }

    parameters {
      display_name = "destination"
      entity_type  = google_dialogflow_cx_entity_type.city.id
      required     = true

      fill_behavior {
        initial_prompt_fulfillment {
          messages {
            text {
              text = ["What is your destination?"]
            }
          }
        }
      }
    }

    parameters {
      display_name = "travel_dates"
      entity_type  = google_dialogflow_cx_entity_type.date.id
      required     = true

      fill_behavior {
        initial_prompt_fulfillment {
          messages {
            text {
              text = ["What are your travel dates?"]
            }
          }
        }
      }
    }


    parameters {
      display_name = "preferred_airline"
      entity_type  = google_dialogflow_cx_entity_type.airline.id
      required     = false

      fill_behavior {
        initial_prompt_fulfillment {
          messages {
            text {
              text = ["Do you have a preferred airline?"]
            }
          }
        }
      }
    }
  }

  transition_routes {
    condition   = "$page.params.status = \"FINAL\""
    target_page = google_dialogflow_cx_page.confirmation_page.id
  }
}

resource "google_dialogflow_cx_page" "confirmation_page" {
  parent       = google_dialogflow_cx_flow.book_flight_flow.id
  display_name = "ConfirmationPage"

  entry_fulfillment {
    messages {
      text {
        text = ["Thank you for providing the details. Your flight booking is being processed."]
      }
    }
  }

}





