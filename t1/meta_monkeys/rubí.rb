module Kernel
  def poner_cadena(str)
    puts str
  end

  def clase(klass, &block)
    instance = Clase.new
    instance.instance_eval(&block)
    instance
  end

  class Clase
    def method_missing(name, *args, &block)
        if name == :atributo_de_lectura
          instance_variable_set("@#{args[0]}".to_sym, nil)
          define_singleton_method("#{args[0]}", -> do
            instance_variable_get("@#{args[0]}")
          end)
        elsif name == :atributo_de_escritura
          instance_variable_set("@#{args[0]}".to_sym, nil)
          define_singleton_method("#{args[0]}=", ->(param) do
            instance_variable_set("@#{args[0]}", param)
          end)
        elsif name == :atributo_de_acceso
          atributo_de_escritura args[0]
          atributo_de_lectura args[0]
        else
          define_singleton_method(name, args[0])
        end
    end
  end
end

@b =
  clase :algo {
    atributo_de_lectura :algo_de_lectura
    atributo_de_escritura :algo_de_escritura
    atributo_de_acceso :algo_accesible

    saludar ->(cadena) {
      poner_cadena cadena
    }
}
