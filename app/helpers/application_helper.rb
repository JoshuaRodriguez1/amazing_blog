module ApplicationHelper
  def nav_li_class
    "hover:underline"
  end

  def tag_class_green
    "ml-4 text-xs inline items-center font-bold leading-sm uppercase px-3 py-1 bg-green-200 text-green-700 rounded-full"
  end

  # TODO: find a better way to manage these helpers, put all this clases inside tailwind configuration
  def tag_class_yellow
    "ml-4 text-xs inline items-center font-bold leading-sm uppercase px-3 py-1 bg-orange-200 text-orange-700 rounded-full"
  end

  def btn_class_red
    "bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 hover:cursor-pointer rounded"
  end

  def btn_class_blue
    "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 hover:cursor-pointer rounded"
  end
end
