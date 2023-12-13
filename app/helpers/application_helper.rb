module ApplicationHelper
  def turbo_app_agent
    turbo_native_app? ? 'turbo_native' : 'turbo_web'
  end

  def arrow_icon(value_difference)
    if value_difference.positive?
      '<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path clip-rule="evenodd" fill-rule="evenodd" d="M10 17a.75.75 0 01-.75-.75V5.612L5.29 9.77a.75.75 0 01-1.08-1.04l5.25-5.5a.75.75 0 011.08 0l5.25 5.5a.75.75 0 11-1.08 1.04l-3.96-4.158V16.25A.75.75 0 0110 17z"></path>
       </svg>'.html_safe
    else
      '<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
         <path clip-rule="evenodd" fill-rule="evenodd" d="M10 3a.75.75 0 01.75.75v10.638l3.96-4.158a.75.75 0 111.08 1.04l-5.25 5.5a.75.75 0 01-1.08 0l-5.25-5.5a.75.75 0 111.08-1.04l3.96 4.158V3.75A.75.75 0 0110 3z"></path>
      </svg>'.html_safe
    end
  end

  def value_color(value_difference)
    if value_difference.positive?
      'text-green-500'
    elsif value_difference.negative?
      'text-red-500'
    else
      'text-gray-500'
    end
  end

  def format_distance(distance)
    (distance / 1000).round(2)
  end
end
