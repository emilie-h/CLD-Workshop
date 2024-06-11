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

resource "google_dialogflow_cx_intent" "book_flight_intent" {
  display_name = "travel.flight"
  parent       = google_dialogflow_cx_agent.agent.id
  priority     = 500000

  training_phrases {
    repeat_count = 1

    parts {
      text = "I want to book a flight"
    }
    parts {
      text = "Can you help me book a flight?"
    }
    parts {
      text = "I need to fly to [destination]"
    }

    parts {
      text = "Flight"
    }
  }
}
