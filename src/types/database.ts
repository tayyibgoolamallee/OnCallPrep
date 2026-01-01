export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      akt_questions: {
        Row: {
          correct_option: string
          created_at: string | null
          difficulty: string | null
          explanation: string
          guideline_refs: string[] | null
          id: string
          is_pro: boolean | null
          options: Json
          published: boolean | null
          question: string
          topic: string
          updated_at: string | null
        }
        Insert: {
          correct_option: string
          created_at?: string | null
          difficulty?: string | null
          explanation: string
          guideline_refs?: string[] | null
          id?: string
          is_pro?: boolean | null
          options: Json
          published?: boolean | null
          question: string
          topic: string
          updated_at?: string | null
        }
        Update: {
          correct_option?: string
          created_at?: string | null
          difficulty?: string | null
          explanation?: string
          guideline_refs?: string[] | null
          id?: string
          is_pro?: boolean | null
          options?: Json
          published?: boolean | null
          question?: string
          topic?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      portfolio_guides: {
        Row: {
          category: string
          content: string
          created_at: string | null
          id: string
          is_pro: boolean | null
          published: boolean | null
          sort_order: number | null
          stage: string
          title: string
          updated_at: string | null
        }
        Insert: {
          category: string
          content: string
          created_at?: string | null
          id?: string
          is_pro?: boolean | null
          published?: boolean | null
          sort_order?: number | null
          stage: string
          title: string
          updated_at?: string | null
        }
        Update: {
          category?: string
          content?: string
          created_at?: string | null
          id?: string
          is_pro?: boolean | null
          published?: boolean | null
          sort_order?: number | null
          stage?: string
          title?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      sca_cases: {
        Row: {
          case_type: string
          created_at: string | null
          difficulty: string | null
          id: string
          is_pro: boolean | null
          key_points: string[]
          model_answer: string
          patient_info: Json
          published: boolean | null
          scenario: string
          time_limit: number
          title: string
          updated_at: string | null
        }
        Insert: {
          case_type: string
          created_at?: string | null
          difficulty?: string | null
          id?: string
          is_pro?: boolean | null
          key_points: string[]
          model_answer: string
          patient_info: Json
          published?: boolean | null
          scenario: string
          time_limit: number
          title: string
          updated_at?: string | null
        }
        Update: {
          case_type?: string
          created_at?: string | null
          difficulty?: string | null
          id?: string
          is_pro?: boolean | null
          key_points?: string[]
          model_answer?: string
          patient_info?: Json
          published?: boolean | null
          scenario?: string
          time_limit?: number
          title?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      user_profiles: {
        Row: {
          created_at: string | null
          email: string
          full_name: string | null
          id: string
          is_admin: boolean | null
          stripe_customer_id: string | null
          stripe_subscription_id: string | null
          subscription_tier: string | null
          updated_at: string | null
        }
        Insert: {
          created_at?: string | null
          email: string
          full_name?: string | null
          id: string
          is_admin?: boolean | null
          stripe_customer_id?: string | null
          stripe_subscription_id?: string | null
          subscription_tier?: string | null
          updated_at?: string | null
        }
        Update: {
          created_at?: string | null
          email?: string
          full_name?: string | null
          id?: string
          is_admin?: boolean | null
          stripe_customer_id?: string | null
          stripe_subscription_id?: string | null
          subscription_tier?: string | null
          updated_at?: string | null
        }
        Relationships: []
      }
      user_progress: {
        Row: {
          completed: boolean | null
          content_id: string
          content_type: string
          created_at: string | null
          id: string
          score: number | null
          time_taken: number | null
          user_id: string
          user_response: string | null
        }
        Insert: {
          completed?: boolean | null
          content_id: string
          content_type: string
          created_at?: string | null
          id?: string
          score?: number | null
          time_taken?: number | null
          user_id: string
          user_response?: string | null
        }
        Update: {
          completed?: boolean | null
          content_id?: string
          content_type?: string
          created_at?: string | null
          id?: string
          score?: number | null
          time_taken?: number | null
          user_id?: string
          user_response?: string | null
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

export type Tables<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Row']
export type InsertTables<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Insert']
export type UpdateTables<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Update']
